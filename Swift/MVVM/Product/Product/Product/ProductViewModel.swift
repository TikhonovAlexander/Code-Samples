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
    
    lazy var updateAvailable = $descriptionText
        .replaceNil(with: "")
        .map { !$0.isEmpty }
        .eraseToAnyPublisher()
    
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
        name = product.name
        description = product.description
        descriptionText = ""
    }
    
    func updateProduct() {
        let descriptionText = self.descriptionText ?? "-"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.product.description = descriptionText
            self?.updateValue()
        }
    }
    
}
