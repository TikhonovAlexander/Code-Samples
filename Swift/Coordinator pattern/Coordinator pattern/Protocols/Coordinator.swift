//
//  Coordinator.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

// https://medium.com/blacklane-engineering/coordinators-essential-tutorial-part-i-376c836e9ba7

protocol Coordinator: class {
    func start()
    func start(with option: DeepLinkOption?)
}
