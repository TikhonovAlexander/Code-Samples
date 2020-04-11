//
//  ImageDefaultCache.swift
//  mylivn
//
//  Created by atikhonov on 13.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class ImageDefaultCache: ImageCache {
    
    private var cache: NSCache<NSString, UIImage>
    
    private var countLimit: Int
    private var totalCostLimit: Int
    
    init(countLimit: Int, totalCostLimit: Int) {
        self.countLimit = countLimit
        self.totalCostLimit = totalCostLimit
        
        cache = NSCache<NSString, UIImage>()
        cache.countLimit = countLimit
        cache.totalCostLimit = totalCostLimit
    }
    
    func loadImage(_ key: String, completion: ((Result<UIImage?, Error>) -> Void)?) {
        let image = cache.object(forKey: NSString(string: key))
        completion?(.success(image))
    }
    
    func saveImage(_ image: UIImage, key: String, completion: ((Result<Void, Error>) -> Void)?) {
        cache.setObject(image, forKey: NSString(string: key))
        completion?(.success(()))
    }
    
    func clearCache() {
        cache.removeAllObjects()
    }
    
    
}
