//
//  MyUIKitView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 28.09.20.
//

import UIKit

class MyUIKitView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        let label = UILabel()
        label.text = "UIKit text"
        label.backgroundColor = .cyan
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        backgroundColor = .gray
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
