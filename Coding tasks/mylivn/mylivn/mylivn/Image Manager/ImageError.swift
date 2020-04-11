//
//  ImageError.swift
//  mylivn
//
//  Created by atikhonov on 09.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

enum ImageError: Error, LocalizedError {
    case network(error: Error)
    case response
    case statusCode(code: Int)
    case dataSerialization(error: Error)
    case file(error: Error)
    case progress
    
    case imageData
    case cacheOverflow
    
    var errorDescription: String? {
        switch self {
        case .network(let error):
            return "ImageError network: \(error.localizedDescription)"
        case .response:
            return "ImageError bad response"
        case .statusCode(let code):
            return "ImageError statusCode: \(code)"
        case .dataSerialization(let error):
            return "ImageError dataSerialization: \(error.localizedDescription)"
        case .file(let error):
            return "ImageError file: \(error.localizedDescription)"
        case .progress:
            return "ImageError progress"
        case .imageData:
            return "ImageError imageData"
        case .cacheOverflow:
            return "ImageError cacheOverflow"
        }
    }
}
