//
//  FeedCreateViewController.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class FeedCreateViewController: UIViewController, FeedCreateView {

    var onHideButtonTap: (() -> Void)?
    var onCompleteCreateItem: ((Feed) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Feed Create"
    }

    deinit {
        print("deinit FeedCreateViewController")
    }
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
        let feed = Feed(name: "New name", description: "New description")
        onCompleteCreateItem?(feed)
    }
}
