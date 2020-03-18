//
//  AppsLayout.swift
//  Collection layout group custom
//
//  Created by Tikhonov, Aleksandr on 18.03.20.
//  Copyright © 2020 Tikhonov, Aleksandr. All rights reserved.
//

import UIKit

class AppsLayout {
    
    private let itemSize: CGSize = CGSize(width: 172.0, height: 172.0)
    private let interItemSpacing: CGFloat = 16.0
    private let interGroupSpacing: CGFloat = 16.0
    private let minimalSectionInset: CGFloat = 16.0
    
    private var regularItemHeight: CGFloat { itemSize.height }
    private let compactItemHeight: CGFloat = 44.0
    private var itemWidth: CGFloat { itemSize.width }
    
    func collectionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (_ : Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupHeight = self.groupHeight(for: layoutEnvironment)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(groupHeight))
            
            let columnsNumber = self.columnsNumber(for: layoutEnvironment)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columnsNumber)
            group.interItemSpacing = .fixed(self.interItemSpacing)
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = self.interGroupSpacing
            section.contentInsets = self.sectionContentInsets(for: columnsNumber, layoutEnvironment: layoutEnvironment)
            
            return section
        }
        return layout
    }
    
    private func columnsNumber(for layoutEnvironment: NSCollectionLayoutEnvironment) -> Int {
        guard layoutEnvironment.traitCollection.horizontalSizeClass == .regular else { return 1 }
        let containerWidth: CGFloat = layoutEnvironment.container.contentSize.width
        var sumWidth = itemWidth + 2 * minimalSectionInset
        var counter = 1
        while sumWidth + interItemSpacing + itemWidth <= containerWidth {
            sumWidth += interItemSpacing
            sumWidth += itemWidth
            counter += 1
        }
        return counter
    }
    
    private func sectionContentInsets(for columnsNumber: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSDirectionalEdgeInsets {
        guard layoutEnvironment.traitCollection.horizontalSizeClass == .regular else { return .zero }
        let containerWidth: CGFloat = layoutEnvironment.container.contentSize.width
        let columns = CGFloat(columnsNumber)
        var sumWidth: CGFloat = 0
        sumWidth += itemWidth * columns
        sumWidth += (columns - 1) * interItemSpacing
        let rest = (containerWidth - sumWidth) / 2.0
        let leftRightInset = max(minimalSectionInset, rest)
        let insets = NSDirectionalEdgeInsets(top: minimalSectionInset, leading: leftRightInset, bottom: minimalSectionInset, trailing: leftRightInset)
        return insets
    }
    
    private func groupHeight(for layoutEnvironment: NSCollectionLayoutEnvironment) -> CGFloat {
        layoutEnvironment.traitCollection.horizontalSizeClass == .regular ? regularItemHeight : compactItemHeight
    }
}

