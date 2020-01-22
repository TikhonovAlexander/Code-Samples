//
//  FeedDetailViewController.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class FeedDetailViewController: UIViewController, FeedDetailView {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var feed: Feed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed detail"
        nameLabel.text = feed?.name ?? "-"
        descriptionLabel.text = feed?.description ?? "-"
    }

    deinit {
        print("deinit FeedDetailViewController")
    }
}
