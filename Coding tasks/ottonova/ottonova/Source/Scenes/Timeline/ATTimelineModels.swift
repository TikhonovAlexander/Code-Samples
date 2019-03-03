//
//  ATTimelineModels.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import Foundation

struct ATTimeline {
    var id: String
    var timestamp: Date
    var title: String?
    var description: String?
}

struct ATTimelineSection {
    var title: String
    var timelines: [ATTimeline]
}

enum ATTimelineModel {
    
    // MARK: Use cases
    
    enum FetchTimelines {
        struct FetchAllRequest {
            var profileId: String
        }
        
        struct Response {
            let result: ATResult<[ATTimelineSection]>
            init(result: ATResult<[ATTimelineSection]>) {
                self.result = result
            }
        }
        
        struct ViewModel {
            var state: ViewControllerState
            init(state: ViewControllerState) {
                self.state = state
            }
        }
        
        enum ViewControllerState {
            case loading
            case result([ATTimelineTableViewSectionModel])
            case emptyResult(title: String, subtitle: String)
            case error(message: String)
        }
    }
}


