//
//  ModuleFactoryImp.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

final class ModuleFactoryImp: AuthModuleFactory, OnboardingModuleFactory, SettingsModuleFactory, DashboardModuleFactory {
    
    // AuthModuleFactory
    
    func makeLoginView() -> LoginView {
        AuthViewController.initiate(for: .auth)
    }
    
    func makeSignUpView() -> SignUpView {
        SignUpController.initiate(for: .auth)
    }
    
    func makeTermsView() -> TermsView {
        TermsController.initiate(for: .auth)
    }
    
    // OnboardingModuleFactory
    
    func makeOnboarding() -> OnboardingView {
        OnboardingViewController.initiate(for: .onboarding)
    }
    
    func makeOnboardingFinal() -> OnboardingFinalView {
        OnboardingFinalViewController.initiate(for: .onboarding)
    }
    
    // SettingsModuleFactory
    
    func makeSettingsView() -> SettingsView {
        SettingsController.initiate(for: .settings)
    }
    
    // DashboardModuleFactory
    
    func makeDashboardView() -> DashboardView {
        DashboardViewController.initiate(for: .dashboard)
    }
       
    
}
