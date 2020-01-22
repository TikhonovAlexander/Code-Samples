//
//  CoordinatorFactory.swift
//  Coordinator pattern
//
//  Created by atikhonov on 15.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

protocol CoordinatorFactory {
    
    func makeTabbarCoordinator() -> (configurator: Coordinator, toPresent: Presentable?)
    func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput
    func makeAuthCoordinator(router: Router) -> Coordinator & AuthCoordinatorOutput
    func makeFeedsCoordinator(navController: UINavigationController?) -> Coordinator
    func makeFeedCreateCoordinator(navController: UINavigationController?) -> (configurator: Coordinator & FeedCreateCoordinatorOutput, toPresent: Presentable?)
}
