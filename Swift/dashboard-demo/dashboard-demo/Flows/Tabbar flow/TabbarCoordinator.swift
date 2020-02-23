//
//  TabbarCoordinator.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class TabbarCoordinator: BaseCoordinator {
    
    private let tabbarView: TabbarView
    private let coordinatorFactory: CoordinatorFactory
    
    init(tabbarView: TabbarView, coordinatorFactory: CoordinatorFactory) {
        self.tabbarView = tabbarView
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        tabbarView.onViewDidLoad = showDashboardFlow()
        tabbarView.onDashboardFlowSelect = showDashboardFlow()
        tabbarView.onSettingsFlowSelect = runSettingsFlow()
    }
    
    private func showDashboardFlow() -> ((UINavigationController) -> ()) {
        { [unowned self] navController in
            if navController.viewControllers.isEmpty {
                let dashboardCoordinator = self.coordinatorFactory.makeDashboardCoordinator(navController: navController)
                self.addDependency(dashboardCoordinator)
                dashboardCoordinator.start()
            }
        }
    }
    
    private func runSettingsFlow() -> ((UINavigationController) -> ()) {
        { [unowned self] navController in
            if navController.viewControllers.isEmpty {
                let settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinator(navController: navController)
                self.addDependency(settingsCoordinator)
                settingsCoordinator.start()
            }
        }
    }
}

