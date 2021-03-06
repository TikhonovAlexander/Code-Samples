//
//  SignUpViewController.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

final class SignUpController: UIViewController, SignUpView {
    
    var onSignUpComplete: (() -> Void)?
    var onTermsButtonTap: (() -> Void)?
    
    @IBOutlet weak var termsLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    var confirmed = false {
        didSet {
            termsLabel.isHidden = !confirmed
            signUpButton.isEnabled = confirmed
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SignUp"
        termsLabel.isHidden = true
        signUpButton.isEnabled = false
    }
    
    @IBAction func signUpClicked(_ sender: AnyObject) {
        if confirmed {
            onSignUpComplete?()
        }
    }
    
    @IBAction func termsButtonClicked(_ sender: AnyObject) {
        onTermsButtonTap?()
    }
    
    func conformTermsAgreement(_ agree: Bool) {
        confirmed = agree
    }
}
