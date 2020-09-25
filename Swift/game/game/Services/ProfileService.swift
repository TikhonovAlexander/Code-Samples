//
//  ProfileService.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 23.09.20.
//

import Combine
import Foundation
class ProfileService {

    func fetchProfiles() -> AnyPublisher<[Profile], Error> {
        Future<[Profile], Error> { promise in
            print("fetchProfiles starts")
            DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) { [self] in
                print("fetchProfiles success")
                let profile1 = randomProfile(for: 1)
                let profile2 = randomProfile(for: 2)
                let profile3 = randomProfile(for: 3)
                let profiles = [profile1, profile2, profile3]
                promise(.success(profiles))
            }
            print("fetchProfiles ends")
        }
        .eraseToAnyPublisher()
    }

    func fetchProfile(for id: Int) -> AnyPublisher<Profile, Error> {
        Future<Profile, Error> { promise in
            print("fetchProfile starts \(id)")
            DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) { [self] in
                print("fetchProfile success \(id)")
                let profile = randomProfile(for: id)
                promise(.success(profile))
            }
            print("fetchProfile ends \(id)")
        }
        .eraseToAnyPublisher()
    }

    private func randomProfile(for id: Int) -> Profile {
        func name(for id: Int) -> String {
            switch id {
            case 1:
                return "Bloodseeker"
            case 2:
                return "Morphling"
            case 3:
                return "Lina"
            default:
                return "-"
            }
        }

        func imageName(for id: Int) -> String {
            switch id {
            case 1:
                return "bloodseeker"
            case 2:
                return "morphling"
            case 3:
                return "lina"
            default:
                return ""
            }
        }

        let _name = name(for: id)
        let _rating = Int.random(in: 1...10)
        let _score = Double.random(in: 0...1000)
        let _imageName = imageName(for: id)

        let profile = Profile(id: id, name: _name, rating: _rating, score: _score, imageName: _imageName)
        return profile
    }
}
