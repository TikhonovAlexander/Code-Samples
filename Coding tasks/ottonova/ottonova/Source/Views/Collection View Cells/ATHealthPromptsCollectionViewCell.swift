//
//  ATHealthPromptsCollectionViewCell.swift
//  ottonova
//
//  Created by atikhonov on 13/02/19
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class ATHealthPromptsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 6.0
        layer.masksToBounds = true
        
    }
}
