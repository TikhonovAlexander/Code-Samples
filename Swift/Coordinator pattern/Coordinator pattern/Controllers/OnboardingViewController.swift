//
//   OnboardingViewController.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

protocol OnboardingViewControllerDelegate: class {
    func nextPage()
}

class OnboardingViewController: UIViewController {
    
    weak var delegate: OnboardingViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Onboarding"
    }
    
    deinit {
        print("OnboardingViewController")
    }
    
    @IBAction func showNextTapped(_ sender: Any) {
        delegate?.nextPage()
    }
}
