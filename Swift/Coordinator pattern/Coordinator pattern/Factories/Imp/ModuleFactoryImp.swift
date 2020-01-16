//
//  ModuleFactoryImp.swift
//  Coordinator pattern
//
//  Created by atikhonov on 16.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

final class ModuleFactoryImp: AuthModuleFactory, OnboardingModuleFactory {
    
    // AuthModuleFactory
    func makeLoginView() -> LoginView {
        AuthViewController.initiate(for: .main)
    }
    
    func makeSignUpView() -> SignUpView {
        SignUpController.initiate(for: .main)
    }
    
    func makeTermsView() -> TermsView {
        TermsController.initiate(for: .main)
    }
    
    // OnboardingModuleFactory
    
    func makeOnboarding() -> OnboardingView {
        OnboardingViewController.initiate(for: .main)
    }
    
    func makeOnboardingFinal() -> OnboardingFinalView {
        OnboardingFinalViewController.initiate(for: .main)
    }
}
