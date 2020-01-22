//
//   OnboardingViewController.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, OnboardingView {
    
    var onNext: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Onboarding"
    }
    
    deinit {
        print("deinit OnboardingViewController")
    }
    
    @IBAction func showNextTapped(_ sender: Any) {
        onNext?()
    }
}
