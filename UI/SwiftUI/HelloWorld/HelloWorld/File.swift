//
//  CarStore.swift
//  HelloWorld
//
//  Created by atikhonov on 21.06.2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import SwiftUI
import Combine

class CarStore: BindableObject  {
    var cars: [Car] {
        didSet {
            didChange.send()
        }
    }
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
    
    var didChange = PassthroughSubject<Void, Never>()
}
