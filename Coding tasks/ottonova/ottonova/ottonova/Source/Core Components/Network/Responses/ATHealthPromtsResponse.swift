//
//  ATTimelineResponse.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import Foundation

struct ATHealthPromtResponse: Decodable {
    var id: String
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case message
    }
}

final class ATHealthPromtsResponse: ATResponseObjectSerializable {
    
    var healthPromts: [ATHealthPromtResponse] = []
    
    static func createObject(from response: HTTPURLResponse, withData data: Data) -> ATHealthPromtsResponse? {
        let decoder = JSONDecoder()
        do {
            let healthPromptsDataResponse = try decoder.decode([ATHealthPromtResponse].self, from: data)
            let healthPromptssResponse = ATHealthPromtsResponse()
            healthPromptssResponse.healthPromts = healthPromptsDataResponse
            return healthPromptssResponse
        } catch let error {
            print("Error: \(error)")
            return nil
        }
    }
    
}

