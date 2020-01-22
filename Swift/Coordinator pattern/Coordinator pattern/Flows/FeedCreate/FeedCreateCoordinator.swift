//
//  FeedCreateCoordinator.swift
//  Coordinator pattern
//
//  Created by atikhonov on 22.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

final class FeedCreateCoordinator: BaseCoordinator, FeedCreateCoordinatorOutput {
    
    var finishFlow: ((Feed?)->())?
    
    var router: Router
    var factory: FeedCreateModuleFactory
    
    init(router: Router, factory: FeedCreateModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        showCreateFeed()
    }
    
    private func showCreateFeed() {
        let feedCreate = factory.makeFeedCreateView()
        feedCreate.onCompleteCreateItem = { [weak self] feed in
            self?.finishFlow?(feed)
        }
        feedCreate.onHideButtonTap = { [weak self] in
          self?.finishFlow?(nil)
        }
        router.setRootModule(feedCreate)
    }
    
}
