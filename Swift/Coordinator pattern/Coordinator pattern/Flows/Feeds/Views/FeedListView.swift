//
//  FeedListView.swift
//  Coordinator pattern
//
//  Created by atikhonov on 22.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

protocol FeedListView: BaseView {
    var onFeedSelect: ((Feed) -> Void)?  { get set }
    var onCreateFeed: (() -> Void)?  { get set }
}
