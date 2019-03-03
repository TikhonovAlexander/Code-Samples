//
//  ATTimelinesResponse.swift
//  ottonova
//
//  Created by atikhonov on 13/02/19
//  Copyright © 2019 atikhonov. All rights reserved.
//

import Foundation

struct ATTimelineResponse: Decodable {
    var id: String
    var timestamp: Date
    var title: String?
    var description: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case timestamp
        case title
        case description
    }
}

final class ATTimelinesResponse: ATResponseObjectSerializable {
    
    var timelines: [ATTimelineResponse] = []
    
    static func createObject(from response: HTTPURLResponse, withData data: Data) -> ATTimelinesResponse? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let timelinesDataResponse = try decoder.decode([ATTimelineResponse].self, from: data)
            let timelinesResponse = ATTimelinesResponse()
            timelinesResponse.timelines = timelinesDataResponse
            return timelinesResponse
        } catch let error {
            print("Error: \(error)")
            return nil
        }
    }
}
