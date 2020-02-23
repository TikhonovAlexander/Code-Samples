//
//  OnboardingCoordinator.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

final class OnboardingCoordinator: BaseCoordinator, OnboardingCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    private var router: Router
    private var factory: OnboardingModuleFactory
    
    init(router: Router, factory: OnboardingModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        showOnboarding()
    }
    
    private func showOnboarding() {
        let onboarding = factory.makeOnboarding()
        onboarding.onNext = { [weak self] in
            self?.showOnboardingFinal()
        }
        router.setRootModule(onboarding)
    }
    
    private func showOnboardingFinal() {
        let onboardingFinal = factory.makeOnboardingFinal()
        onboardingFinal.onFinish = { [weak self] in
            self?.finishFlow?()
        }
        router.push(onboardingFinal, animated: true)
    }
    
}
