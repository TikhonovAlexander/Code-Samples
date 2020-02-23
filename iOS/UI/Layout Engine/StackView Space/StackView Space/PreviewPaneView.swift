//
//  PreviewPaneView.swift
//  StackView Space
//
//  Created by atikhonov on 19.03.19.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class PreviewPaneView: UIView {

    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = spacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alignment = .center
        return sv
    }()
    
    var spacing: CGFloat = 16.0 {
        didSet {
            stackView.spacing = spacing
        }
    }
    
    private var overflow = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    func show(items: [UIView]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        items.forEach { self.stackView.addArrangedSubview($0) }
        overflow.removeAll()
    }
    
    override func layoutSubviews() {
        // After we call super.layoutSubviews() the layout engine has updated the bounds and center of our subviews based on the views and constraints.
        super.layoutSubviews()
        
        while stackView.bounds.width > bounds.width, let extra = stackView.arrangedSubviews.last {
            extra.removeFromSuperview()
            overflow.insert(extra, at: 0)
            updateConstraintsIfNeeded()
            super.layoutSubviews()
        }
        
        while let nextItem = overflow.first, stackView.bounds.width + spacing + nextItem.intrinsicContentSize.width <= bounds.width {
            stackView.addArrangedSubview(nextItem)
            overflow.remove(at: 0)
            updateConstraintsIfNeeded()
            super.layoutSubviews()
        }
        

    }

}
