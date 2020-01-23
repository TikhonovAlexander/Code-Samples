//
//  ATProfileModels.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import Foundation

struct ATProfile {
    let id: String
    var name: String?
}

enum ATProfileModel {
    
    // MARK: Use cases

    enum FetchProfile {
        struct FetchProfileRequest {}
        
        struct Response {
            let result: ATResult<ATProfile>
            init(result: ATResult<ATProfile>) {
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
            case result
            case error(message: String)
        }
    }
    
}
