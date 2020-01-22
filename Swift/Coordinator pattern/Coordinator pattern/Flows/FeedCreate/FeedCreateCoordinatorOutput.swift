//
//  FeedCreateCoordinatorOutput.swift
//  Coordinator pattern
//
//  Created by atikhonov on 22.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

protocol FeedCreateCoordinatorOutput: class {
    var finishFlow: ((Feed?)->())? { get set }
}
