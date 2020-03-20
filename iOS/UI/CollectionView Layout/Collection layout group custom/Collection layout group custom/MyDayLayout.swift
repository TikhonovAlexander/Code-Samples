//
//  MyDayLayout.swift
//  Collection layout group custom
//
//  Created by Tikhonov, Aleksandr on 18.03.20.
//  Copyright © 2020 Tikhonov, Aleksandr. All rights reserved.
//

import UIKit

class MyDayLayout {
    func collectionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (_ : Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(400))
            let group = NSCollectionLayoutGroup.custom(layoutSize: groupSize) { (layoutEnvironment: NSCollectionLayoutEnvironment) -> [NSCollectionLayoutGroupCustomItem] in
                
                let i1 = NSCollectionLayoutGroupCustomItem(frame: CGRect.init(x: 0, y: 0, width: 200, height: 100))
                let i2 = NSCollectionLayoutGroupCustomItem(frame: CGRect.init(x: 216, y: 0, width: 100, height: 100))
                let i3 = NSCollectionLayoutGroupCustomItem(frame: CGRect.init(x: 0, y: 116, width: 316, height: 200))
                
                return [i1, i2, i3]
            }
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
        return layout
    }
}
