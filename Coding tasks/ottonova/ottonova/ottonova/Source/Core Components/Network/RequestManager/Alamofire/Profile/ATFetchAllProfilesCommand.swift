//
//  ATFetchAllProfilesCommand.swift
//  ottonova
//
//  Created by atikhonov on 13/02/19
//  Copyright © 2019 atikhonov. All rights reserved.
//

import Alamofire

class ATFetchAllProfilesCommand: ATOttonovaRequestBasicCommand {
    
    var request: ATProfileModel.FetchProfile.FetchProfileRequest
    var completion: ((ATResult<ATProfile>) -> Void)
    
    init(request: ATProfileModel.FetchProfile.FetchProfileRequest, completion: @escaping (ATResult<ATProfile>) -> Void) {
        self.request = request
        self.completion = completion
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "user/customer/profiles"
    }
    
    var parameters: Parameters? { return nil }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    func objectSerializable(from response: ATProfilesResponse, completion: @escaping (ATResult<ATProfile>) -> Void) {
        
        let profiles: [ATProfile] = response.profiles.map { ATProfile(id: $0.id, name: $0.name) }
        
        if let profile = profiles.first {
            completion(.success(profile))
        } else {
            let error = NSError(domain: "No profiles", code: 0, userInfo: nil)
            completion(.failure(error))
        }
        
    }
}
