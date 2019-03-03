//
//  ATDetailRouter.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import UIKit

@objc protocol ATDetailRoutingLogic {
}

protocol ATDetailDataPassing {
    var dataStore: ATDetailDataStore? { get }
}

class ATDetailRouter: NSObject, ATDetailRoutingLogic, ATDetailDataPassing {
    weak var viewController: ATDetailViewController?
    var dataStore: ATDetailDataStore?
    
    // MARK: Routing
    
    // MARK: Passing data
    
}
