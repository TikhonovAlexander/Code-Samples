//
//  ProductCellViewModel.swift
//  Product
//
//  Created by atikhonov on 19.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation
import Combine

class ProductCellViewModel {
    
    @Published var name: String?
    @Published var description: String?
    
    var product: Product
    
    init(product: Product) {
        self.product = product
        configure()
    }
    
    private func configure() {
        name = product.name
        description = product.description
    }
}
