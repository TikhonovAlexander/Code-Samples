//
//  LoadedViewController.swift
//  loadView
//
//  Created by Aleksandr Tikhonov on 08.03.19.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class MyView: UIView {
    override public class var layerClass: Swift.AnyClass {
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        guard let gradient = self.layer as? CAGradientLayer else { return }
        gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class LoadedViewController: UIViewController {
    
    // If we use .xib file we should comment loadView() method
    override func loadView() {
        super.loadView()
        view = MyView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.text = "Loaded View Controller"
    }
}
