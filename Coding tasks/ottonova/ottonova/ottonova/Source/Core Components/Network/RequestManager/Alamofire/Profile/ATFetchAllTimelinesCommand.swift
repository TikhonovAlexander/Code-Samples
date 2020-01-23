//
//  ATFetchAllTimelinesCommand.swift
//  ottonova
//
//  Created by atikhonov on 13/02/19
//  Copyright © 2019 atikhonov. All rights reserved.
//

import Alamofire

class ATFetchAllTimelinesCommand: ATOttonovaRequestBasicCommand {
    
    var request: ATTimelineModel.FetchTimelines.FetchAllRequest
    var completion: ((ATResult<[ATTimeline]>) -> Void)
    
    init(request: ATTimelineModel.FetchTimelines.FetchAllRequest, completion: @escaping (ATResult<[ATTimeline]>) -> Void) {
        self.request = request
        self.completion = completion
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "user/customer/profiles/\(request.profileId)/timeline-events"
    }
    
    var parameters: Parameters? { return nil }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    func objectSerializable(from response: ATTimelinesResponse, completion: @escaping (ATResult<[ATTimeline]>) -> Void) {
        
        let timelines: [ATTimeline] = response.timelines.map { ATTimeline(id: $0.id, timestamp: $0.timestamp, title: $0.title, description: $0.description) }
        
        completion(.success(timelines))
    }
}
