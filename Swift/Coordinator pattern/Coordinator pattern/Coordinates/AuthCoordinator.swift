//
//  AuthCoordinator.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

final class AuthCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    weak var window: UIWindow?
    var completion: (() -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    convenience init(navigationController: UINavigationController, window: UIWindow? = nil, completion: (() -> Void)?) {
        self.init(navigationController: navigationController)
        self.window = window
        self.completion = completion
    }
    
    func start() {
        let auth = AuthViewController.initiate(for: .main)
        setRootViewController(rootViewController: auth) { [weak self]  _ in
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                guard let strongSelf = self else { return }
                sceneDelegate.appCoordinator?.children.removeAll()
                sceneDelegate.appCoordinator?.navigationController = nil
                sceneDelegate.appCoordinator?.children.append(strongSelf)
            }
        }
    }
    
    func setRootViewController(rootViewController: UIViewController, completion: ((Bool) -> Void)?) {
        guard let window = window else { print("window is nil"); return }
        UIView.transition(with: window, duration: 1.0, options: [.transitionFlipFromLeft, .allowAnimatedContent], animations: {
            window.rootViewController = rootViewController
        }, completion: completion)
    }
    
}
