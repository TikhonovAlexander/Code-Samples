//
//  OnboardingFinalViewController.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
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
        print("deinit OnboardingFinalViewController")
    }
    
    @IBAction func finishTapped(_ sender: Any) {
        onFinish?()
    }
    
}
