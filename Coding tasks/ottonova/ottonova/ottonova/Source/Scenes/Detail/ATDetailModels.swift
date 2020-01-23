//
//  ATDetailModels.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import Foundation

enum ATDetailModel {
    
    // MARK: Use cases

    enum FetchDetail {
        struct FetchDetailRequest {}
        
        struct Response {}
        
        struct ViewModel {
            var state: ViewControllerState
            init(state: ViewControllerState) {
                self.state = state
            }
        }
        
        enum ViewControllerState {
            case result(name: String)
        }
    }
    
}
