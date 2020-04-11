//
//  ImageCache.swift
//  mylivn
//
//  Created by atikhonov on 12.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

protocol ImageCache {
    func loadImage(_ key: String, completion: ((Result<UIImage?, Error>) -> Void)?)
    func saveImage(_ image: UIImage, key: String, completion: ((Result<Void, Error>) -> Void)?)
    func clearCache()
}

