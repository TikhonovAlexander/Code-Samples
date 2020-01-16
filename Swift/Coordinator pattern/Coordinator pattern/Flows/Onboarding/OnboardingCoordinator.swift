//
//  OnboardingCoordinator.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

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
