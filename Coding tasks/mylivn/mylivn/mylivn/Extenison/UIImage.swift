//
//  UIImage.swift
//  mylivn
//
//  Created by atikhonov on 10.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

extension UIImage {
    public func imageRoundedIntoCircle() -> UIImage {
        let radius = min(size.width, size.height) / 2.0
        var squareImage = self
        
        if size.width != size.height {
            let squareDimension = min(size.width, size.height)
            let squareSize = CGSize(width: squareDimension, height: squareDimension)
            squareImage = imageAspectScaled(toFill: squareSize)
        }
        
        UIGraphicsBeginImageContextWithOptions(squareImage.size, false, 0.0)
        
        let clippingPath = UIBezierPath(
            roundedRect: CGRect(origin: CGPoint.zero, size: squareImage.size),
            cornerRadius: radius
        )
        
        clippingPath.addClip()
        
        squareImage.draw(in: CGRect(origin: CGPoint.zero, size: squareImage.size))
        
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return roundedImage
    }
    
    public func imageAspectScaled(toFill size: CGSize) -> UIImage {
        assert(size.width > 0 && size.height > 0, "You cannot safely scale an image to a zero width or height")

        let imageAspectRatio = self.size.width / self.size.height
        let canvasAspectRatio = size.width / size.height

        var resizeFactor: CGFloat

        if imageAspectRatio > canvasAspectRatio {
            resizeFactor = size.height / self.size.height
        } else {
            resizeFactor = size.width / self.size.width
        }

        let scaledSize = CGSize(width: self.size.width * resizeFactor, height: self.size.height * resizeFactor)
        let origin = CGPoint(x: (size.width - scaledSize.width) / 2.0, y: (size.height - scaledSize.height) / 2.0)

        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        draw(in: CGRect(origin: origin, size: scaledSize))

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext() ?? self
        UIGraphicsEndImageContext()

        return scaledImage
    }
}
