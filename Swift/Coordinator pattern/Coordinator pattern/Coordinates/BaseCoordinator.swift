//
//  BaseCoordinator.swift
//  Coordinator pattern
//
//  Created by atikhonov on 15.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        start(with: nil)
    }
    
    func start(with option: DeepLinkOption?) {}
    
    func addDependency(_ coordinator: Coordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard !childCoordinators.isEmpty, let coordinator = coordinator else { return }
        childCoordinators.removeAll(where: { $0 === coordinator })
    }
}
