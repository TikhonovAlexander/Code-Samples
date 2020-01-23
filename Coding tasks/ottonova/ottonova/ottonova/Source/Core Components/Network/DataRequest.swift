//
//  DataRequest.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright © 2019 ottonova. All rights reserved.
//

import Alamofire

extension DataRequest {
    
    @discardableResult
    func responseObject<T: ATResponseObjectSerializable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        let responseSerializer = DataResponseSerializer<T> { request, response, data, error in
            guard error == nil else { return .failure(ATBackendError.network(error: error!)) }
            let dataResponseSerializer = DataRequest.dataResponseSerializer()
            let result = dataResponseSerializer.serializeResponse(request, response, data, error)
            guard case let .success(data) = result else {
                return .failure(ATBackendError.dataSerialization(error: result.error!))
            }
            
            guard let response = response, let responseObject = T.createObject(from: response, withData: data) else {
                return .failure(ATBackendError.objectSerialization(reason: "JSON could not be serialized: \(data)"))
            }
            return .success(responseObject)
        }
        return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
    
}
