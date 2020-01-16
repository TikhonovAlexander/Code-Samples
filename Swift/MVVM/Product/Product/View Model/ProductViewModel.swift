//
//  ProductViewModel.swift
//  Product
//
//  Created by atikhonov on 16.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation
import Combine

class ProductViewModel {
    
    var product: Product
    
    var nameSubject = CurrentValueSubject<String?, Never>(nil)
    var descriptionSubject = CurrentValueSubject<String?, Never>(nil)
    
    init(product: Product) {
        self.product = product
        updateValue()
    }
    
    func updateValue() {
        nameSubject.value = product.name
        descriptionSubject.value = product.description
    }
    
}
