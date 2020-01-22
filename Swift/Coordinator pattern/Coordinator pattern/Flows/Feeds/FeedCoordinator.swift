//
//  FeedCoordinator.swift
//  Coordinator pattern
//
//  Created by atikhonov on 08.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

final class FeedCoordinator: BaseCoordinator {
    
    var router: Router
    var factory: FeedsModuleFactory
    var coordinatorFactory: CoordinatorFactory
    
    init(router: Router, factory: FeedsModuleFactory, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.factory = factory
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        showFeedList()
    }
    
    private func showFeedList() {
        let feedList = factory.makeFeedListView()
        feedList.onFeedSelect = { [weak self] feed in
            self?.showFeedSelect(feed: feed)
        }
        feedList.onCreateFeed = { [weak self] in
            self?.showCreateFeed()
        }
        router.setRootModule(feedList)
    }
    
    private func showFeedSelect(feed: Feed) {
        let feedDetail = factory.makeFeedDetailView(feed: feed)
        router.push(feedDetail)
    }
    
    private func showCreateFeed() {
//        let coordinator = coordinatorFactory.
    }
}
