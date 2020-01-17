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
    
    @Published var name: String?
    @Published var description: String?
    @Published var descriptionText: String?
    
    var updateAction = PassthroughSubject<Void, Never>()
    
    private var product: Product
    private var subscriptions: Set<AnyCancellable> = []
    
    init(product: Product) {
        self.product = product
        updateValue()
        
        updateAction
            .sink { _ in
                self.updateProduct()
            }
            .store(in: &subscriptions)
    }
    
    func updateValue() {
        print(#function)
        name = product.name
        let text: String = descriptionText ?? " "
        description = product.description + "  " + text
        descriptionText = ""
    }
    
    func updateProduct() {
        print(#function)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            let newProduct = Product(name: "Pepsi", description: "Gesund getrank")
            self?.product = newProduct
            self?.updateValue()
        }
    }
    
}
