//
//  ATStoryboardHelper.swift
//  ottonova
//
//  Created by atikhonov on 13/02/19
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

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
