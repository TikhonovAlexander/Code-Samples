//
//  CoordinatorFactoryImp.swift
//  Coordinator pattern
//
//  Created by atikhonov on 16.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

final class CoordinatorFactoryImp: CoordinatorFactory {
    
    func makeOnboardingCoordinator(router: Router) -> Coordinator & OnboardingCoordinatorOutput {
        OnboardingCoordinator(router: router, factory: ModuleFactoryImp())
    }
    
    func makeAuthCoordinator(router: Router) -> Coordinator & AuthCoordinatorOutput {
        AuthCoordinator(router: router, factory: ModuleFactoryImp())
    }
    
    func makeFeedsCoordinator(router: Router) -> Coordinator {
        FeedCoordinator(router: router, factory: ModuleFactoryImp())
    }
}
