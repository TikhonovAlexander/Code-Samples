//
//  ATFetchAllTimelinesCommand.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import Alamofire

class ATFetchAllHealthPromptsCommand: ATOttonovaRequestBasicCommand {
    
    var request: ATHealthPromptsModel.FetchHealthPrompts.FetchAllRequest
    var completion: ((ATResult<[ATHealthPrompt]>) -> Void)
    
    init(request: ATHealthPromptsModel.FetchHealthPrompts.FetchAllRequest, completion: @escaping (ATResult<[ATHealthPrompt]>) -> Void) {
        self.request = request
        self.completion = completion
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "user/customer/profiles/\(request.profileId)/health-prompts"
    }
    
    var parameters: Parameters? { return nil }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    func objectSerializable(from response: ATHealthPromtsResponse, completion: @escaping (ATResult<[ATHealthPrompt]>) -> Void) {

        let healthPrompts: [ATHealthPrompt] = response.healthPromts.map { ATHealthPrompt(id: $0.id, message: $0.message) }
        
        completion(.success(healthPrompts))
    }
}

