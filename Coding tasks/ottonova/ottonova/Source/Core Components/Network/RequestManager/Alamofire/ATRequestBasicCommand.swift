//
//  ATRequestBasicCommand.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import Alamofire

protocol ATRequestBasicCommand: ATBasicCommand, URLRequestConvertible {
    
    associatedtype T: ATResponseObjectSerializable
    associatedtype Q
    
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var parameterEncoding: ParameterEncoding { get }
    
    var completion: ((ATResult<Q>) -> Void) { get set }
    
    func objectSerializable(from response: T, completion: @escaping (ATResult<Q>) -> Void )
    
}

extension ATRequestBasicCommand {
    func execute() {
        ATAlamofireRequestManager.request(self) { (result: ATResult<T>) in
            switch result {
            case .success(let value):
                self.objectSerializable(from: value, completion: self.completion)
            case .failure(let error):
                self.completion(.failure(error))
            }
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url: URL = try baseURL.asURL()
        let fullURL: URL = url.appendingPathComponent(path)
        
        var urlRequest: URLRequest = URLRequest(url: fullURL)
        urlRequest.httpMethod = method.rawValue
        
        urlRequest = try parameterEncoding.encode(urlRequest, with: parameters)
        
        return urlRequest
    }
}
