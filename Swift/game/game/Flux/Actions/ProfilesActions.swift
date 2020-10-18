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

    class FetchProfile: ProfileAction {

        deinit {
            print("deinit FetchProfile")
        }

        let profileId: Int

        var cancel: Cancellable? = nil

        init(profileId: Int) {
            self.profileId = profileId
        }

        func publisher() -> AnyPublisher<Profile, Error> {
            let service: ProfileService = ProfileService()
            return service.fetchProfile(for: profileId)
        }
    }

    struct SetProfile: ProfileAction {
        let profile: Profile
    }
}
