//
//  ImageViewController.swift
//  mylivn
//
//  Created by atikhonov on 10.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView?.image = image
        if let size = image?.size {
            label.text = "Image --- h:\(size.height), w:\(size.width)"
        }
        title = "Raw Image"
    }
}
