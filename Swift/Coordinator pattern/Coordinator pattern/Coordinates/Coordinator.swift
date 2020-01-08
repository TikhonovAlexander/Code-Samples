//
//  Coordinator.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

protocol Coordinator {
    
    var children: [Coordinator] { set get }
    
    init(navigationController: UINavigationController)
    
    func start()
}
