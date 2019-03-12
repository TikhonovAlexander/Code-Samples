//
//  ViewController.swift
//  RootViewMargins
//
//  Created by atikhonov on 12.03.19.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redView: UIView!
    var yellowView: UIView = {
        let v = UIView()
        v.backgroundColor = .yellow
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.addSubview(yellowView)
        redView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20.0, leading: 5.0, bottom: 0.0, trailing: 5.0)
        let layoutMarginsGuide = redView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            yellowView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            yellowView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            yellowView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            yellowView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
            ])
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(systemMinimumLayoutMargins)
        viewRespectsSystemMinimumLayoutMargins = false
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    }


}

