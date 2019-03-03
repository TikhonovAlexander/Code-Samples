//
//  ATCollectionViewCellModel.swift
//  ottonova
//
//  Created by atikhonov on 13/02/19
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

protocol ATCollectionViewCellModel {
    associatedtype CellType: UICollectionViewCell
    @discardableResult func configure(cell: CellType, at indexPath: IndexPath, in collectionView: UICollectionView) -> CellType
}

extension ATCollectionViewCellModel {
    static var cellType: UICollectionViewCell.Type {
        return CellType.self
    }
}
