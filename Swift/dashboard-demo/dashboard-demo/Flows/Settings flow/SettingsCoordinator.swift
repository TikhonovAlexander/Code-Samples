//
//  SettingsCoordinator.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

final class SettingsCoordinator: BaseCoordinator {
    
    private let factory: SettingsModuleFactory
    private let router: Router
    
    init(router: Router, factory: SettingsModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showSettings()
    }
    
    private func showSettings() {
        let settings = factory.makeSettingsView()
        router.setRootModule(settings)
    }
}
