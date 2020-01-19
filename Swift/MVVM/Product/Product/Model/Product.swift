//
//  Product.swift
//  Product
//
//  Created by atikhonov on 16.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

class Product {
    var name: String
    var description: String
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}

func feedProducts() -> [Product] {
    [
        Product(name: "BMW", description: "Bavaria's pride"),
        Product(name: "Audi", description: "Cool car"),
        Product(name: "Porshe", description: "Luxary"),
        Product(name: "Tesla", description: "Electric car"),
        Product(name: "Mercedes", description: "Excellent quality")
    ]
}
