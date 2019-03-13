//
//  ViewController.swift
//  Layout Guides
//
//  Created by atikhonov on 13.03.19.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.backgroundColor = .red
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cancelButton)
        
        let okButton = UIButton(type: .system)
        okButton.setTitle("Ok", for: .normal)
        okButton.backgroundColor = .green
        okButton.setTitleColor(.white, for: .normal)
        okButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(okButton)
        
        let leadingLayoutGuide = UILayoutGuide()
        let middleLayoutGuide = UILayoutGuide()
        let trailingLayoutGuide = UILayoutGuide()
        
        view.addLayoutGuide(leadingLayoutGuide)
        view.addLayoutGuide(middleLayoutGuide)
        view.addLayoutGuide(trailingLayoutGuide)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        let c1 = leadingLayoutGuide.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        let c2 = leadingLayoutGuide.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor)
        let c3 = middleLayoutGuide.leadingAnchor.constraint(equalTo: cancelButton.trailingAnchor)
        let c4 = middleLayoutGuide.trailingAnchor.constraint(equalTo: okButton.leadingAnchor)
        let c5 = trailingLayoutGuide.leadingAnchor.constraint(equalTo: okButton.trailingAnchor)
        let c6 = trailingLayoutGuide.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        
        let c7 = cancelButton.widthAnchor.constraint(equalTo: okButton.widthAnchor)
        
        let c8 = leadingLayoutGuide.widthAnchor.constraint(equalTo: middleLayoutGuide.widthAnchor)
        let c9 = middleLayoutGuide.widthAnchor.constraint(equalTo: trailingLayoutGuide.widthAnchor)
        
        let c10 = cancelButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        let c11 = okButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        
        NSLayoutConstraint.activate([c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11])
    }


}

