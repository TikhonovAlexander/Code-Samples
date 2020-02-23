//
//  OnboardingViewController.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
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
        print("deinit ЬщвгдуOnboardingViewController")
    }
    
    @IBAction func showNextTapped(_ sender: Any) {
        onNext?()
    }
}
