//
//  ATTimelineRouter.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import UIKit

@objc protocol ATTimelineRoutingLogic {
    func routeToDetail()
}

protocol ATTimelineDataPassing {
    var dataStore: ATTimelineDataStore? { get }
}

class ATTimelineRouter: NSObject, ATTimelineRoutingLogic, ATTimelineDataPassing {
    weak var viewController: ATTimelineTableViewController?
    var dataStore: ATTimelineDataStore?
    
    // MARK: Routing
    
    func routeToDetail() {
        let destinationVC = ATDetailViewController.initiate(for: .main)
        guard var destinationDS = destinationVC.router?.dataStore else { return }
        guard let dataStore = dataStore else { return }
        passDataToDetail(sourceDataStore: dataStore, destinationDataStore: &destinationDS)
        viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    // MARK: Passing data
    
    func passDataToDetail(sourceDataStore: ATTimelineDataStore, destinationDataStore: inout ATDetailDataStore) {
        destinationDataStore.timeline = sourceDataStore.selectedTimeline
    }
}
