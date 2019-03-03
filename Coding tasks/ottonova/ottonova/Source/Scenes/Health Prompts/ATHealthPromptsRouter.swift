//
//  ATHealthPromptsRouter.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import UIKit

@objc protocol ATHealthPromptsRoutingLogic {}

protocol ATHealthPromptsDataPassing {
    var dataStore: ATHealthPromptsDataStore? { get }
}

class ATHealthPromptsRouter: NSObject, ATHealthPromptsRoutingLogic, ATHealthPromptsDataPassing {
    weak var viewController: ATHealthPromptsCollectionViewController?
    var dataStore: ATHealthPromptsDataStore?
    
    // MARK: Routing
    
    // MARK: Passing data
    
}
