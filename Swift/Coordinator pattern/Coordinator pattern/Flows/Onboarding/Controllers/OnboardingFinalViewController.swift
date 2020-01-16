//
//   OnboardingFinalViewController.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class OnboardingFinalViewController: UIViewController, OnboardingFinalView {
    
    var onFinish: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Onboarding Final"
    }

    deinit {
        print("OnboardingFinalViewController")
    }
    
    @IBAction func finishTapped(_ sender: Any) {
        onFinish?()
    }
    
}
