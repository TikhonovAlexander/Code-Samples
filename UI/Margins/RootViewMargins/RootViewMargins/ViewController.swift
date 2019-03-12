//
//  ViewController.swift
//  RootViewMargins
//
//  Created by atikhonov on 12.03.19.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(systemMinimumLayoutMargins)
        viewRespectsSystemMinimumLayoutMargins = false
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    }


}

