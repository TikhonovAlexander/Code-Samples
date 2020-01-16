//
//  FeedCoordinator.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

final class FeedCoordinator {
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    weak var window: UIWindow?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    convenience init(navigationController: UINavigationController, window: UIWindow? = nil) {
        self.init(navigationController: navigationController)
        self.window = window
    }
    
    func start() {
        let feeds = FeedsViewController.initiate(for: .main)
        setRootViewController(rootViewController: feeds) { _ in
            
        }
    }
    
    func setRootViewController(rootViewController: UIViewController, completion: ((Bool) -> Void)?) {
        guard let window = window else { print("window is nil"); return }
        UIView.transition(with: window, duration: 1.0, options: [.transitionFlipFromLeft, .allowAnimatedContent], animations: {
            window.rootViewController = rootViewController
        }, completion: completion)
    }
    
}
