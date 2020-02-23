//
//  ViewController.swift
//  StackView Space
//
//  Created by atikhonov on 19.03.19.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var previewPane: PreviewPaneView = {
        let view = PreviewPaneView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let itemCount = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        refreshRandomViews()
    }
    
    private func setupView() {
        view.backgroundColor = .yellow
        view.addSubview(previewPane)
        let guide = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            previewPane.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            previewPane.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            previewPane.trailingAnchor.constraint(equalTo: guide.trailingAnchor)
            ])
    }
    
    
    private func refreshRandomViews() {
        var views = [UIView]()
        for count in 0..<itemCount {
            let view = UILabel()
            view.text = "\(count)"
            let size = CGFloat.random(in: 1...64) + 64.0
            view.font = UIFont.systemFont(ofSize: size)
            view.backgroundColor = (count % 2 == 0) ? .red : .green
            views.append(view)
        }
        previewPane.show(items: views)
    }
    
}

