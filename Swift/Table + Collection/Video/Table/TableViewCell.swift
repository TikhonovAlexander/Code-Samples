//
//  TableViewCell.swift
//  Video
//
//  Created by atikhonov on 22.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var collectionController: CollectionViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        let vcView = vc.view!
        vcView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(vcView)
        vcView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        vcView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        vcView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        vcView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionController = vc
        // add controller as a child?
        print(#function)
    }
    
    func setImageName(imageName: String) {
        collectionController?.imageName = imageName
    }
}
