//
//  UIViewController.swift
//  ottonova
//
//  Created by atikhonov on 13/02/19
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

extension UIViewController {
    static func initiate(for storyboard: ATAppStoryboard) -> Self {
        return storyboard.initiate(viewControllerType: self)
    }
}
