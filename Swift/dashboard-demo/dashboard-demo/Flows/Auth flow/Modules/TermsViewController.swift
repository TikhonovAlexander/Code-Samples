//
//  TermsViewController.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class TermsController: UIViewController, TermsView {
    
    @IBOutlet weak var termsSwitch: UISwitch! {
        didSet {
            termsSwitch.isOn = confirmed
        }
    }
    
    var confirmed = false
    var onConfirmChanged: ((Bool) -> ())?
    
    @IBAction func termsSwitchValueChanged(_ sender: UISwitch) {
        onConfirmChanged?(sender.isOn)
    }
}
