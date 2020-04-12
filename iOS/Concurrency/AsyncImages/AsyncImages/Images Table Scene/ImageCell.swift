//
//  ImageCell.swift
//  AsyncImages
//
//  Created by tikhonov on 11.04.20.
//  Copyright © 2020 tikhonov. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var isLoading: Bool {
        get {
            activityIndicator.isAnimating
        }
        set {
            if newValue {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
        }
    }


    func show(image: UIImage?) {
      photoImageView.image = image
    }
}
