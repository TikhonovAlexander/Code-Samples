//
//  ImageProvider.swift
//  AsyncImages
//
//  Created by tikhonov on 12.04.20.
//  Copyright © 2020 tikhonov. All rights reserved.
//

import UIKit

protocol ImageProvider: AnyObject {
    var image: UIImage? { get }
}
