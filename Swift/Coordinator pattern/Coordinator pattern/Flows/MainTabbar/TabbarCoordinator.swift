//
//  TabbarCoordinator.swift
//  Coordinator pattern
//
//  Created by atikhonov on 22.01.2020.
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
        tabbarView.onViewDidLoad = showFeedFlow()
        tabbarView.onFeedFlowSelect = showFeedFlow()
        tabbarView.onSettingsFlowSelect = runSettingsFlow()
    }
    
    private func showFeedFlow() -> ((UINavigationController) -> ()) {
        { [unowned self] navController in
            if navController.viewControllers.isEmpty == true {
                let feedCoordinator = self.coordinatorFactory.makeFeedsCoordinator(navController: navController)
                self.addDependency(feedCoordinator)
                feedCoordinator.start()
            }
        }
    }
    
    private func runSettingsFlow() -> ((UINavigationController) -> ()) {
        { [unowned self] navController in
//            if navController.viewControllers.isEmpty == true {
//                let settingsCoordinator = self.coordinatorFactory.makeSettingsCoordinator(navController: navController)
//                self.addDependency(settingsCoordinator)
//                settingsCoordinator.start()
//            }
        }
    }
}

