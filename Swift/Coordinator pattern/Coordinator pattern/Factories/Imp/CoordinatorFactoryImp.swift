//
//  CoordinatorFactoryImp.swift
//  Coordinator pattern
//
//  Created by atikhonov on 16.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

final class CoordinatorFactoryImp: CoordinatorFactory {
    func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?) {
        let tabbarController = TabbarController.initiate(for: .main)
        let coordinator = TabbarCoordinator(tabbarView: tabbarController, coordinatorFactory: CoordinatorFactoryImp())
        return (coordinator, tabbarController)
    }

    func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput {
        OnboardingCoordinator(router: router, factory: ModuleFactoryImp())
    }
    
    func makeAuthCoordinator(router: Router) -> Coordinator & AuthCoordinatorOutput {
        AuthCoordinator(router: router, factory: ModuleFactoryImp())
    }
    
    func makeFeedsCoordinator(navController: UINavigationController?) -> Coordinator {
        FeedCoordinator(router: router(navController), factory: ModuleFactoryImp(), coordinatorFactory: CoordinatorFactoryImp())
    }
    
    func makeFeedCreateCoordinator(navController: UINavigationController?) -> (configurator: Coordinator & FeedCreateCoordinatorOutput, toPresent: Presentable?) {
        let router = self.router(navController)
        let coordinator = FeedCreateCoordinator(router: router, factory: ModuleFactoryImp())
        return (coordinator, router)
    }
    
    private func router(_ navController: UINavigationController?) -> Router {
        RouterImp(rootController: navigationController(navController))
    }
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController {
            return navController
        }
        else {
            return UINavigationController()
        }
    }
}
