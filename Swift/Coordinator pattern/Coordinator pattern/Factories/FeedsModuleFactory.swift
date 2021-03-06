//
//  FeedsModuleFactory.swift
//  Coordinator pattern
//
//  Created by atikhonov on 22.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

protocol FeedsModuleFactory {
    func makeFeedListView() -> FeedListView
    func makeFeedDetailView(feed: Feed) -> FeedDetailView
}
