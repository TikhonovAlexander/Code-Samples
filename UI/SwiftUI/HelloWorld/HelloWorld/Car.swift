//
//  Car.swift
//  HelloWorld
//
//  Created by atikhonov on 20.06.2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import SwiftUI

struct Car: Identifiable {
    var id = UUID()
    let name: String
    let price: Double
    let imageName: String
    let hasBTC: Bool
}

#if DEBUG

let testData: [Car] = [
    Car(name: "Car 1", price: 1, imageName: "1", hasBTC: true),
    Car(name: "Car 2", price: 2, imageName: "2", hasBTC: false),
    Car(name: "Car 3", price: 3, imageName: "3", hasBTC: true),
    Car(name: "Car 4", price: 4, imageName: "4", hasBTC: true),
    Car(name: "Car 5", price: 5, imageName: "5", hasBTC: false),
    Car(name: "Car 6", price: 6, imageName: "6", hasBTC: true)
]

#endif
