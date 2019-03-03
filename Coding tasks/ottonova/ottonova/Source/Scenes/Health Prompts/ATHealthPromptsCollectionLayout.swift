//
//  LineLayout.swift
//  ottonova
//
//  Created by atikhonov on 13/02/19
//  Copyright © 2019 atikhonov. All rights reserved.
//

import UIKit

class ATHealthPromptsCollectionLayout: UICollectionViewLayout {
    
    var itemSize: CGSize = .zero
    var spacingBetweenItems: CGFloat = 0.0
    
    private var contentBounds: CGRect = .zero
    private var cachedAttributes = [UICollectionViewLayoutAttributes]()
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView  else { return }
        
        let collectioViewSize = collectionView.bounds.size
        cachedAttributes.removeAll()
        contentBounds = CGRect(origin: .zero, size: collectioViewSize)
        
        let cvHeight = collectioViewSize.height
        let attributesY = (cvHeight - itemSize.height) / 2.0
        
        let sections = collectionView.numberOfSections
        var lastFrame: CGRect = .zero
        
        for section in 0..<sections {
            let count = collectionView.numberOfItems(inSection: section)
            var currentIndex = 0
            
            while currentIndex < count {
                let indexPath = IndexPath(row: currentIndex, section: section)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                
                // spacing between items
                let attributesX = lastFrame.maxX + spacingBetweenItems
                let rect = CGRect(x: attributesX, y: attributesY, width: itemSize.width, height: itemSize.height)
                attributes.frame = rect
                
                cachedAttributes.append(attributes)
                contentBounds = contentBounds.union(rect)
                
                currentIndex += 1
                lastFrame = rect
            }
            
            if section < (sections - 1) {
                // spacing between section
                lastFrame.origin.x += spacingBetweenItems
            }
        }

        // set up right spacing from superview
        var lf = lastFrame
        lf.size.width += spacingBetweenItems
        contentBounds = contentBounds.union(lf)
    }
    
    override var collectionViewContentSize: CGSize {
        return contentBounds.size
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView = collectionView else { return false }
        return !newBounds.size.equalTo(collectionView.bounds.size)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cachedAttributes[indexPath.item]
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        
        // Find any cell that sits within the query rect.
        guard let lastIndex = cachedAttributes.indices.last,
            let firstMatchIndex = binSearch(rect, start: 0, end: lastIndex) else { return attributesArray }
        
        // Starting from the match, loop up and down through the array until all the attributes
        // have been added within the query rect.
        for attributes in cachedAttributes[..<firstMatchIndex].reversed() {
            guard attributes.frame.maxX >= rect.minX else { break }
            attributesArray.append(attributes)
        }
        
        for attributes in cachedAttributes[firstMatchIndex...] {
            guard attributes.frame.minX <= rect.maxX else { break }
            attributesArray.append(attributes)
        }
        
        return attributesArray
    }
    
    private func binSearch(_ rect: CGRect, start: Int, end: Int) -> Int? {
        guard start <= end else { return nil }
        let mid = (start + end) / 2
        let attr = cachedAttributes[mid]
        
        if attr.frame.intersects(rect) {
            return mid
        } else {
            if attr.frame.maxX < rect.minX {
                return binSearch(rect, start: mid + 1, end: end)
            } else {
                return binSearch(rect, start: start, end: mid - 1)
            }
        }
    }
}
