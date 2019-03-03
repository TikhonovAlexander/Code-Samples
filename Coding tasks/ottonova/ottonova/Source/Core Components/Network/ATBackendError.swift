//
//  ATBackendError.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright © 2019 ottonova. All rights reserved.
//

import Foundation

enum ATBackendError: Error, LocalizedError {
    case network(error: Error) 
    case dataSerialization(error: Error)
    case objectSerialization(reason: String)
    
    var errorDescription: String? {
        switch self {
        case .network:
            return "errorDescription network"
        case .dataSerialization:
            return "errorDescription dataSerialization"
        case .objectSerialization:
            return "errorDescription objectSerialization"
        }
    }
}
