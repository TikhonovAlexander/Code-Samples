//
//  ViewController.swift
//  SaveArea
//
//  Created by atikhonov on 10.03.19.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate(
            [
                redView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                redView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                redView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                redView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
        
        print("safeAreaInsets: ", view.safeAreaInsets)
        let customBarHeight: CGFloat = 50.0
        additionalSafeAreaInsets = UIEdgeInsets(top: customBarHeight, left: 0, bottom: 0, right: 0)
        print("additionalSafeAreaInsets: ", additionalSafeAreaInsets)
    }


}

