//
//  AuthCoordinator.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {
    
    var finishFlow: (() -> Void)?
    
    private let factory: AuthModuleFactory
    private let router: Router
    private weak var signupView: SignUpView?
    
    init(router: Router, factory: AuthModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showLogin()
    }
    
    private func showLogin() {
        let login = factory.makeLoginView()
        login.onCompleteAuth = { [weak self] in
            self?.finishFlow?()
        }
        
        login.onSignUpButtonTap = { [weak self] in
            self?.showSignUp()
        }
        router.setRootModule(login)
    }
    
    private func showSignUp() {
        signupView = factory.makeSignUpView()
        signupView?.onSignUpComplete = { [weak self] in
            self?.finishFlow?()
        }
        
        signupView?.onTermsButtonTap = { [weak self] in
            self?.showTerms()
        }
        router.push(signupView)
    }
    
    private func showTerms() {
        let terms = factory.makeTermsView()
        terms.confirmed = signupView?.confirmed ?? false
        terms.onConfirmChanged = { [weak self] confirmed in
            self?.signupView?.conformTermsAgreement(confirmed)
        }
        router.push(terms, animated: true)
    }
    
}
