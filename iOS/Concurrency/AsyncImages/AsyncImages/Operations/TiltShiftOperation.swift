//
//  TiltShiftOperation.swift
//  AsyncImages
//
//  Created by tikhonov on 12.04.20.
//  Copyright © 2020 tikhonov. All rights reserved.
//

import UIKit

final class TiltShiftOperation: Operation {
    private static let context = CIContext()
    
    var outputImage: UIImage?
    
    private let inputImage: UIImage
    
    init(image: UIImage) {
        inputImage = image
        super.init()
    }
    
    override func main() {
        guard let filter = TiltShiftFilter(image: inputImage, radius: 3),
            let output = filter.outputImage else {
                print("Failed to generate tilt shift image")
                return
        }
        
        let fromRect = CGRect(origin: .zero, size: inputImage.size)
        guard let cgImage = TiltShiftOperation.context.createCGImage(output, from: fromRect) else {
            print("No image generated")
            return
        }
        
        outputImage = UIImage(cgImage: cgImage)
    }
}

