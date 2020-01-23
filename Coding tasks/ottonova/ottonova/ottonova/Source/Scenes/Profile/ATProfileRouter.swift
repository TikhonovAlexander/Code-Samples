//
//  ATProfileRouter.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import UIKit

@objc protocol ATProfileRoutingLogic {
    func passingToHealthPrompts()
}

protocol ATProfileDataPassing {
    var dataStore: ATProfileDataStore? { get }
}

class ATProfileRouter: NSObject, ATProfileRoutingLogic, ATProfileDataPassing {
    weak var viewController: ATProfileViewController?
    var dataStore: ATProfileDataStore?
    
    var promtsController: ATHealthPromptsCollectionViewController? {
        return viewController?.children.first(where: { $0 is ATHealthPromptsCollectionViewController }) as? ATHealthPromptsCollectionViewController
    }
    
    var timelinesController: ATTimelineTableViewController? {
        return viewController?.children.first(where: { $0 is ATTimelineTableViewController }) as? ATTimelineTableViewController
    }
    
    // MARK: Routing
    
    // MARK: Passing data
    
    func passingToHealthPrompts() {
        guard let profile = dataStore?.profile else { return }
        promtsController?.fetchHealthPrompts(profileId: profile.id, completion: nil)
        timelinesController?.fetchTimelines(profileId: profile.id, completion: nil)
    }
}
