//
//  ProfilesReducer.swift
//  game
//
//  Created by atikhonov on 10.09.2020.
//

import Foundation
import Combine

func profilesStateReducer(state: inout ProfilesState, action: ProfileAction) -> AnyPublisher<AppAction, Never>? {
    switch action {
    case let action as ProfilesActions.FetchAllProfiles:
        return action
            .publisher()
            .replaceError(with: [ ])
            .map { ProfilesActions.SetAllProfiles(profiles: $0) }
            .map { AppAction.profiles(action: $0) }
            .eraseToAnyPublisher()
    case let action as ProfilesActions.SetAllProfiles:
        var profiles: [Int: Profile] = [:]
        action.profiles.forEach { profiles[$0.id] = $0 }
        state.profiles = profiles
    default:
        fatalError()
    }
    return nil
}
