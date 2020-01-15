//
//  AppCoordinator.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

final class AppCoordinator {
    
    var children: [Coordinator] = []
    
    weak var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
//        if Storage.shared.isLoggined() {
//            let feedCoordinator = FeedCoordinator(navigationController: navigationController)
//            addChild(feedCoordinator)
//            feedCoordinator.start()
//        } else {
//            let onboardingCoordinator = OnboardingCoordinator(navigationController: navigationController)
//            onboardingCoordinator.delegate = self
//            addChild(onboardingCoordinator)
//            onboardingCoordinator.start()
//        }
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

extension AppCoordinator: OnboardingCoordinatorDelegate {
    func onboardingEnded(needsAuth: Bool) {
        let navigationController = UINavigationController()
        if needsAuth {
            let coordinator = AuthCoordinator(navigationController: navigationController, window: window) {
//                addChild(coordinator)
            }
            coordinator.start()
        } else {
            let coordinator = FeedCoordinator(navigationController: navigationController)
//            addChild(coordinator)
            coordinator.start()
        }
        
    }
}
