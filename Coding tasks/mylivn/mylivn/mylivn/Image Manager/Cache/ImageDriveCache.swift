//
//  ImageDriveCache.swift
//  mylivn
//
//  Created by atikhonov on 12.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class ImageDriveCache: ImageCache {
    
    private var maxCount: Int = 8
    private var fileHelper = FileHelper()
    
    @UserDefault("storage", defaultValue: [])
    private var storage: [String]
    
    func loadImage(_ key: String, completion: ((Result<UIImage?, Error>) -> Void)?) {
        guard storage.contains(key) else {
            completion?(.success(nil))
            return
        }
        let avatarsURL = fileHelper.avatarsURL
        let savedURL = avatarsURL.appendingPathComponent(key)
        do {
            let data = try Data(contentsOf: savedURL)
            let image = UIImage(data: data)
            completion?(.success(image))
        } catch (let error) {
            completion?(.failure(error))
        }
    }
    
    func saveImage(_ image: UIImage, key: String, completion: ((Result<Void, Error>) -> Void)?) {
        
        guard storage.count < maxCount else {
            completion?(.failure(ImageError.cacheOverflow))
            return
        }
        
        var imageData: Data? = image.pngData()
        if imageData == nil {
            imageData = image.jpegData(compressionQuality: 1.0)
        }
        guard let data = imageData else {
            completion?(.failure(ImageError.imageData))
            return
        }
        
        do {
            try fileHelper.createAvatarsDirectoryIfNeeded()
            let savedURL = try fileHelper.removeFileIfNeeded(fileName: key)
            try data.write(to: savedURL)
            
            storage.append(key)
            completion?(.success(()))
        } catch (let error) {
            completion?(.failure(error))
        }
        
    }
    
    func clearCache() {
        storage = []
        // remove all files in avatars directory
        do {
            for key in storage {
                try _ = fileHelper.removeFileIfNeeded(fileName: key)
            }
        } catch (let error) {
            print("Clear cache: \(error)")
        }
    }
    
}
