//
//  TiltShiftOperation.swift
//  AsyncImages
//
//  Created by tikhonov on 12.04.20.
//  Copyright © 2020 tikhonov. All rights reserved.
//

import UIKit

final class TiltShiftOperation: Operation, ImageProvider {
    private static let context = CIContext()
    
    var outputImage: UIImage?
    
    private let inputImage: UIImage?
    
    var image: UIImage? { outputImage }
    
    /// Callback which will be run *on the main thread*
    /// when the operation completes.
    var onImageProcessed: ((UIImage?) -> Void)?
    
    init(image: UIImage? = nil) {
        inputImage = image
        super.init()
    }
    
    override func main() {
        
        let dependencyImage = dependencies
            .compactMap { ($0 as? ImageProvider)?.image }
            .first
        
        guard let inputImage = inputImage ?? dependencyImage else {
            return
        }
        
        guard let filter = TiltShiftFilter(image: inputImage, radius:3),
            let output = filter.outputImage else {
                print("Failed to generate tilt shift image")
                return
        }
        
        let fromRect = CGRect(origin: .zero, size: inputImage.size)
        guard
            let cgImage = TiltShiftOperation.context.createCGImage(output, from: fromRect),
            let rendered = cgImage.rendered()
            else {
                print("No image generated")
                return
        }
        
        outputImage = UIImage(cgImage: rendered)
        
        if let onImageProcessed = onImageProcessed {
            DispatchQueue.main.async { [weak self] in
                onImageProcessed(self?.outputImage)
            }
        }
    }
}

