//
//  FeedCreateViewController.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class FeedCreateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Feed detail 2"
    }

    deinit {
        print("deinit FeedCreateViewController")
    }
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
        
    }
}
