//
//  FeedCreateView.swift
//  Coordinator pattern
//
//  Created by atikhonov on 22.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

protocol FeedCreateView: BaseView {
    var onHideButtonTap: (() -> Void)? { get set }
    var onCompleteCreateItem: ((Feed) -> ())? { get set }
}
