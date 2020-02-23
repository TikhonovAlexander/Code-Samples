//
//  DashboardCoordinator.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

class DashboardCoordinator: BaseCoordinator {
    
    private let factory: DashboardModuleFactory
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, factory: DashboardModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showDashboard()
    }
    
    private func showDashboard() {
        let dashboard = factory.makeDashboardView()
        router.setRootModule(dashboard)
    }
}
