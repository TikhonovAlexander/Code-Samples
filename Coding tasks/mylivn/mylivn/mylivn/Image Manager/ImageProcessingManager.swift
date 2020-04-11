//
//  ImageProcessingManager.swift
//  mylivn
//
//  Created by atikhonov on 10.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

typealias AvatarViewOptions = [AvatarViewOption]

enum AvatarViewOption {
    case cropped
    case resized(size: CGSize)
}

class ImageProcessingManager {
    
    func imageProcessing(_ image: UIImage, options: AvatarViewOptions) -> UIImage {
        var newImage = image
        for option in options {
            switch option {
            case .cropped:
                newImage = newImage.imageRoundedIntoCircle()
            case .resized(let size):
                newImage = newImage.imageAspectScaled(toFill: size)
            }
        }
        return newImage
    }
}
