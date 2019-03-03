//
//  ATAlamofireRequestManager.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright © 2019 ottonova. All rights reserved.
//

import Foundation
import Alamofire

class ATAlamofireRequestManager {
    
    private static var responseHandlerQueue = DispatchQueue(label: "ATAlamofireRequestManager.ResponseHandlerQueue", qos: .utility, attributes: [], autoreleaseFrequency: .workItem, target: nil)
    
    static let sessionManager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        let requestHandler = ATAccessTokenAdapter()
        sessionManager.adapter = requestHandler
        return sessionManager
    }()
    
    static func request<T: ATResponseObjectSerializable>(_ request: URLRequestConvertible, completion: ((ATResult<T>) -> Void)?) {
        sessionManager.request(request).validate().responseObject(queue: responseHandlerQueue) { (response: DataResponse<T>) in
            if let result = response.result.value {
                completion?(.success(result))
            } else if let error = response.error {
                completion?(.failure(error))
            }
        }
    }
}
