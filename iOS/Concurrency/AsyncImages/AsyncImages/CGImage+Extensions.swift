//
//  CGImage+Extensions.swift
//  AsyncImages
//
//  Created by tikhonov on 12.04.20.
//  Copyright © 2020 tikhonov. All rights reserved.
//

import Foundation
import UIKit

extension CGImage {
    func rendered()-> CGImage? {
        guard let colorSpace = self.colorSpace else {
            return nil
        }
        
        guard let context = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: bitsPerComponent,
            bytesPerRow: bytesPerRow,
            space: colorSpace,
            bitmapInfo: bitmapInfo.rawValue)
            else {
                return nil
        }
        
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        context.draw(self, in: rect)
        return context.makeImage()
    }
}
