//
//  ATHealthPromptsModels.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import Foundation

struct ATHealthPrompt {
    let id: String
    var message: String?
}

enum ATHealthPromptsModel {
    
    // MARK: Use cases
    
    enum FetchHealthPrompts {
        struct FetchAllRequest {
            var profileId: String
        }
        
        struct Response {
            let result: ATResult<[ATHealthPrompt]>
            init(result: ATResult<[ATHealthPrompt]>) {
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
            case result([ATHealthPromptsCollectionViewCellModel])
            case emptyResult(title: String, subtitle: String)
            case error(message: String)
        }
    }

}

