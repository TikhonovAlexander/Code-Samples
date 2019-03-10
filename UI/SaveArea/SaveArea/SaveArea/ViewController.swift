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
        
        let rootViewSafeAreaButton = UIButton(type: .system)
        let rootViewMarginsButton = UIButton(type: .system)
        
        rootViewSafeAreaButton.translatesAutoresizingMaskIntoConstraints = false
        rootViewSafeAreaButton.setTitle("Safe Area example", for: .normal)
        rootViewSafeAreaButton.addTarget(self, action: #selector(rootViewSafeAreaButtonTapped(sender:)), for: .touchUpInside)
        redView.addSubview(rootViewSafeAreaButton)
        
        rootViewMarginsButton.translatesAutoresizingMaskIntoConstraints = false
        rootViewMarginsButton.setTitle("Margins example", for: .normal)
        rootViewMarginsButton.addTarget(self, action: #selector(rootViewMarginsButtonTapped(sender:)), for: .touchUpInside)
        redView.addSubview(rootViewMarginsButton)
        
        NSLayoutConstraint.activate(
            [
                redView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                redView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                redView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                redView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                
                rootViewSafeAreaButton.centerXAnchor.constraint(equalToSystemSpacingAfter: redView.centerXAnchor, multiplier: 1.0),
                rootViewSafeAreaButton.centerYAnchor.constraint(equalTo: redView.centerYAnchor, constant: -20.0),
                
                
                rootViewMarginsButton.centerXAnchor.constraint(equalToSystemSpacingAfter: redView.centerXAnchor, multiplier: 1.0),
                rootViewMarginsButton.centerYAnchor.constraint(equalTo: redView.centerYAnchor, constant: 20.0)
            ])
        
        print("safeAreaInsets: ", view.safeAreaInsets)
        let customBarHeight: CGFloat = 50.0
        additionalSafeAreaInsets = UIEdgeInsets(top: customBarHeight, left: 0, bottom: 0, right: 0)
        print("additionalSafeAreaInsets: ", additionalSafeAreaInsets)
        
        
    }

    @objc func rootViewSafeAreaButtonTapped(sender: UIButton) {
        print(#function)
    }
    
    @objc func rootViewMarginsButtonTapped(sender: UIButton) {
        print(#function)
    }

}

