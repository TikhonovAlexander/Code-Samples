//
//   OnboardingFinalViewController.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

protocol OnboardingFinalViewControllerDelegate: class {
    func onboardingEnded(needsAuth: Bool)
}

class OnboardingFinalViewController: UIViewController {

    weak var delegate: OnboardingFinalViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Onboarding Final"
    }

    deinit {
        print("OnboardingFinalViewController")
    }
    
    @IBAction func showFeedsTapped(_ sender: Any) {
        delegate?.onboardingEnded(needsAuth: false)
    }
    
    @IBAction func showAuthTapped(_ sender: Any) {
        delegate?.onboardingEnded(needsAuth: true)
    }
    
}
