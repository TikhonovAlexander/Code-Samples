//
//  ATHealthPromptsCollectionViewCellModel.swift
//  ottonova
//
//  Created by atikhonov on 13/02/19
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class ATHealthPromptsCollectionViewCellModel: ATCollectionViewCellModel {
    
    var title: String?
    
    init(title: String?) {
        self.title = title
    }
    
    func configure(cell: ATHealthPromptsCollectionViewCell, at indexPath: IndexPath, in collectionView: UICollectionView) -> ATHealthPromptsCollectionViewCell {
        cell.titleLabel.text = title
        return cell
    }
}
