//
//  ATProfilesResponse.swift
//  ottonova
//
//  Created by atikhonov on 13/02/19
//  Copyright © 2019 atikhonov. All rights reserved.
//

import Foundation

struct ATProfileResponse: Decodable {
    var id: String
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "profile_id"
        case name = "first_name"
    }
}

final class ATProfilesResponse: ATResponseObjectSerializable {
    
    var profiles: [ATProfileResponse] = []
    
    static func createObject(from response: HTTPURLResponse, withData data: Data) -> ATProfilesResponse? {
        let decoder = JSONDecoder()
        do {
            let profilesDataResponse = try decoder.decode([ATProfileResponse].self, from: data)
            let profileResponse = ATProfilesResponse()
            profileResponse.profiles = profilesDataResponse
            return profileResponse
        } catch let error {
            print("Error: \(error)")
            return nil
        }
    }
}
