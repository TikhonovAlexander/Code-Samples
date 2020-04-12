//
//  FilterViewController.swift
//  AsyncImages
//
//  Created by tikhonov on 12.04.20.
//  Copyright © 2020 tikhonov. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    @IBOutlet private var tilted: UIImageView!
    @IBOutlet private var label: UILabel!
    @IBOutlet private var spinner: UIActivityIndicatorView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        filterMethod()
    }
    
    private func filterMethod() {
        
        defer {
            spinner.stopAnimating()
        }
        
        let image = UIImage(named: "dark_road_small")!
        
        guard let filter = TiltShiftFilter(image: image, radius: 3), let output = filter.outputImage else {
                label.text = "Failed to generate tilt shift image"
                return
        }
        
        let context = CIContext()
        
        guard let cgImage = context.createCGImage(output, from: CGRect(origin: .zero, size: image.size)) else {
            label.text = "No image generated"
            return
        }
        
        tilted.image = UIImage(cgImage: cgImage)
    }
    
    deinit {
        print("deinit FilterViewController")
    }
}
