//
//  ProductsViewModel.swift
//  Product
//
//  Created by atikhonov on 19.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation
import Combine

class ProductsViewModel {
    
    @Published var searchText: String?
    @Published var productViewModels: [ProductCellViewModel] = []
    
    private var products: [Product] = []
    
    init(products: [Product]) {
        self.products = products
        updateViewModels()
    }
    
    func fetchProducts(with searchTerm: String?) {
        
    }
    
    func productViewModel(at index: Int) -> ProductViewModel {
        ProductViewModel(product: products[index])
    }
    
    func updateViewModels() {
        productViewModels = products.map { ProductCellViewModel(product: $0) }
    }
}
