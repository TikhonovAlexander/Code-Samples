//
//  AppState.swift
//  game
//
//  Created by atikhonov on 25.08.2020.
//

import Foundation

struct AppState {
    var profilesState: ProfilesState
    
    init() {
        profilesState = ProfilesState()
    }
    
    #if DEBUG
    init(profilesState: ProfilesState) {
        self.profilesState = profilesState
    }
    #endif
}

var sampleAppState: AppState = {
    var profiles: [Int: Profile] = [:]
    sampleProfiles.forEach { profile in
        profiles[profile.id] = profile
    }
    let profilesState = ProfilesState(profiles: profiles)
    return AppState(profilesState: profilesState)
}()
