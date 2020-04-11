//
//  ImageManager.swift
//  mylivn
//
//  Created by atikhonov on 10.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class ImageManager {
    
    static let shared = ImageManager()
    
    // ImageDriveCache() or ImageDefaultCache()
    private var imageCache: ImageCache = ImageDefaultCache(countLimit: 8, totalCostLimit: 10_000_000)
    private var imageProcessing = ImageProcessingManager()
    private var imageDownloader = ImageDownloaderManager()
    private var fileHelper = FileHelper()
    
    func loadImage(_ url: URL, options: AvatarViewOptions = [], progress: ((Result<Float, Error>) -> Void)? = nil, completion: ((Result<UIImage, Error>) -> Void)?) {
        loadCachedImage(url, options: options, progress: progress, completion: completion)
    }
    
    func loadCachedImage(_ url: URL, options: AvatarViewOptions = [], progress: ((Result<Float, Error>) -> Void)? = nil, completion: ((Result<UIImage, Error>) -> Void)?) {
        let key = url.lastPathComponent
        imageCache.loadImage(key) { [weak self] result in
            switch result {
            case .success(let image):
                if let image = image {
                    completion?(.success(image))
                } else {
                    self?.loadOriginImage(url, options: options, progress: progress, completion: completion)
                }
            case .failure(let error):
                print(error)
                self?.loadOriginImage(url, options: options, progress: progress, completion: completion)
            }
        }
    }
    
    func loadOriginImage(_ url: URL, options: AvatarViewOptions = [], progress: ((Result<Float, Error>) -> Void)? = nil, completion: ((Result<UIImage, Error>) -> Void)?) {
        imageDownloader.load(url, progress: progress) { [weak self] result in
            switch result {
            case .success(let fileURL):
                guard let data = try? Data(contentsOf: fileURL) else {
                    completion?(.failure(ImageError.imageData))
                    return
                }
                guard let image = UIImage(data: data) else {
                    completion?(.failure(ImageError.imageData))
                    return
                }
                guard let strongSelf = self else { return }
                let key = url.lastPathComponent
                let newImage = strongSelf.imageProcessing.imageProcessing(image, options: options)
                strongSelf.imageCache.saveImage(newImage, key: key, completion: { result in
                    switch result {
                    case .success:
                        completion?(.success(newImage))
                    case .failure(let error):
                        print(error)
                        completion?(.success(newImage))
                    }
                    try? FileManager.default.removeItem(at: fileURL)
                })
            case .failure(let error):
                completion?(.failure(error))
            }
        }
        
    }
    
    func clearCache() {
        imageCache.clearCache()
    }
    
}
