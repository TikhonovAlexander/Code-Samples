//
//  Extensions.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

extension UIViewController {
    static func initiate(for storyboard: ATAppStoryboard) -> Self {
        return storyboard.initiate(viewControllerType: self)
    }
}

enum ATAppStoryboard: String {
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
    
    func initiate<T: UIViewController>(viewControllerType: T.Type) -> T {
        let storyboard = UIStoryboard(name: rawValue, bundle: nil)
        let viewControllerIdentifier = viewControllerType.stringName()
        guard let vc = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as? T else { fatalError("Can't initiate \(viewControllerIdentifier) for \(rawValue) storyboard")}
        return vc
    }
}

extension NSObject {
    static func stringName() -> String {
        return String(describing: self)
    }
}
