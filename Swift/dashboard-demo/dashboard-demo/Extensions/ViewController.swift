//
//  ViewController.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

extension UIViewController {
    static func initiate(for storyboard: AppStoryboard) -> Self {
        return storyboard.initiate(viewControllerType: self)
    }
}
