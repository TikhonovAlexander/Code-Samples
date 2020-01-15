//
//  OnboardingCoordinator.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

protocol OnboardingCoordinatorDelegate: class {
    func onboardingEnded(needsAuth: Bool)
}

final class OnboardingCoordinator {
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    weak var delegate: OnboardingCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let onboarding = OnboardingViewController.initiate(for: .main)
        onboarding.delegate = self
        navigationController.pushViewController(onboarding, animated: false)
    }
}

extension OnboardingCoordinator: OnboardingViewControllerDelegate {
    func nextPage() {
        let final = OnboardingFinalViewController.initiate(for: .main)
        final.delegate = self
        navigationController.pushViewController(final, animated: true)
    }
}

extension OnboardingCoordinator: OnboardingFinalViewControllerDelegate {
    func onboardingEnded(needsAuth: Bool) {
        delegate?.onboardingEnded(needsAuth: needsAuth)
    }
}
