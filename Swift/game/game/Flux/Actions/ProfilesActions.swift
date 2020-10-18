//
//  ProfilesActions.swift
//  game
//
//  Created by atikhonov on 10.09.2020.
//

import Foundation
import Combine

protocol ProfileAction: Action {}

struct ProfilesActions {
    
    class FetchAllProfiles: ProfileAction {
        
        deinit {
            print("deinit FetchAllProfiles")
        }
        
        var cancel: Cancellable? = nil
        
        func publisher() -> AnyPublisher<[Profile], Error> {
            let service: ProfileService = ProfileService()
            return service.fetchProfiles()
        }
    }
    
    struct SetAllProfiles: ProfileAction {
        let profiles: [Profile]
    }

}
