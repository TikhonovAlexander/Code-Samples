//
//  ViewController.swift
//  LayoutMarginsRelativeArrangement
//
//  Created by atikhonov on 16.03.19.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var sv1: UIStackView!
    @IBOutlet var sv2: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(sv1.isLayoutMarginsRelativeArrangement)
        print(sv2.isLayoutMarginsRelativeArrangement)
        
        sv1.addBackground(color: .purple)
        sv2.addBackground(color: .red, radius: 5.0)
    }

}

