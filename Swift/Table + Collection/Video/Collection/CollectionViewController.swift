//
//  CollectionViewController.swift
//  Video
//
//  Created by atikhonov on 22.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let oneLineLayout = collectionViewLayout as? OneLineLayout {
            oneLineLayout.itemSize = CGSize(width: 100, height: 100)
        }
    }

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.videoImageView.image = UIImage(named: imageName)
        return cell
    }

}
