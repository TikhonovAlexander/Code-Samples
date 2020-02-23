//
//  DashboardViewController.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, DashboardView {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Dashboard"
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        if view.traitCollection.horizontalSizeClass == .compact {
            label.text = "iPhone"
        } else {
            label.text = "iPad"
        }
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}
