//
//  TiltShiftFilter.swift
//  AsyncImages
//
//  Created by tikhonov on 12.04.20.
//  Copyright © 2020 tikhonov. All rights reserved.
//

import UIKit
import CoreGraphics

public class TiltShiftFilter: CIFilter {
    private static let defaultRadius = 10.0
    
    public var inputImage: CIImage?
    public var inputRadius: Double = defaultRadius
    
    override public var name: String {
        get { "TiltShiftFilter" }
        set { }
    }
    
    override public func setDefaults() {
        super.setDefaults()
        inputRadius = TiltShiftFilter.defaultRadius
    }
    
    override public var inputKeys: [String] {
        get { [kCIInputImageKey, kCIInputRadiusKey] }
    }
    
    private func ciImage(from filterName: String, parameters: [String: Any]) -> CIImage? {
        guard let filtered = CIFilter(name: filterName, parameters: parameters) else {
            return nil
        }
        
        return filtered.outputImage
    }
    
    override public var outputImage: CIImage? {
        guard let inputImage = inputImage else {
            return nil
        }
        
        let clamped = inputImage.clampedToExtent()
        let blurredImage = clamped.applyingGaussianBlur(sigma: inputRadius)
        
        var gradientParameters = [
            "inputPoint0": CIVector(x: 0, y: 0.75 * inputImage.extent.height),
            "inputColor0": CIColor(red: 0, green: 1, blue: 0, alpha: 1),
            "inputPoint1": CIVector(x: 0, y: 0.5 * inputImage.extent.height),
            "inputColor1": CIColor(red: 0, green: 1, blue: 0, alpha: 0)
        ];
        
        guard let gradientImage = ciImage(from: "CILinearGradient", parameters: gradientParameters) else {
            return nil
        }
        
        gradientParameters["inputPoint0"] = CIVector(x: 0, y: 0.25 * inputImage.extent.height)
        
        guard let backgroundGradientImage = ciImage(from: "CILinearGradient", parameters: gradientParameters) else {
            return nil
        }
        
        let maskParameters = [
            kCIInputImageKey: gradientImage,
            kCIInputBackgroundImageKey: backgroundGradientImage
        ]
        
        guard let maskImage = ciImage(from: "CIAdditionCompositing", parameters: maskParameters) else {
            return nil
        }
        
        let combinedParameters = [
            kCIInputImageKey: blurredImage,
            kCIInputBackgroundImageKey: clamped,
            kCIInputMaskImageKey: maskImage
        ]
        
        return ciImage(from: "CIBlendWithMask", parameters: combinedParameters)
    }
    
    convenience init?(image: UIImage, radius: Double = TiltShiftFilter.defaultRadius) {
        guard let backing = image.ciImage ?? CIImage(image: image) else {
            return nil
        }
        
        self.init()
        
        inputImage = backing
        inputRadius = radius
    }
}

