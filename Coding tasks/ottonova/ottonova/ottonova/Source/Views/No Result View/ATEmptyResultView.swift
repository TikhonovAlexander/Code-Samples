//
//  ATTimelineNoResultView.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class ATEmptyResultView: UIView {

    @IBOutlet var titleLabel: UILabel!

    func configure(title: String) {
        titleLabel.text = title
    }
    
}
