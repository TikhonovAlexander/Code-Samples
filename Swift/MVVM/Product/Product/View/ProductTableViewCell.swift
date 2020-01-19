//
//  ProductTableViewCell.swift
//  Product
//
//  Created by atikhonov on 19.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit
import Combine

class ProductTableViewCell: UITableViewCell {

    var subscriptions: Set<AnyCancellable> = []
    
    var productViewModel: ProductCellViewModel! {
        didSet {
            bind()
        }
    }
    
    func bind() {
        productViewModel
            .$name
            .assign(to: \.text, on: textLabel!)
            .store(in: &subscriptions)
        productViewModel
            .$description
            .assign(to: \.text, on: detailTextLabel!)
            .store(in: &subscriptions)
    }

}
