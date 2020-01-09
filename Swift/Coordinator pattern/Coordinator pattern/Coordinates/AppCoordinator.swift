//
//  AppCoordinator.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController?
    weak var window: UIWindow?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    convenience init(navigationController: UINavigationController, window: UIWindow? = nil) {
        self.init(navigationController: navigationController)
        self.window = window
    }
    
    func start() {
        let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController!)
        onboardingCoordinator.delegate = self
        children.append(onboardingCoordinator)
        onboardingCoordinator.start()
    }
}

extension AppCoordinator: OnboardingCoordinatorDelegate {
    func onboardingEnded(needsAuth: Bool) {
        let navigationController = UINavigationController()
        if needsAuth {
            let coordinator = AuthCoordinator(navigationController: navigationController, window: window) {
//                self.children .append(coo)
            }
            coordinator.start()
        } else {
            let coordinator = FeedCoordinator(navigationController: navigationController)
            coordinator.start()
        }
        
    }
}
