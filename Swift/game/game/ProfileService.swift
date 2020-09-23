//
//  ProfileService.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 23.09.20.
//

import Combine
import Foundation
class ProfileService {
    func fetchProfile() -> AnyPublisher<Profile, Error> {
        Future<Profile, Error> { promise in
            print("Future starts")
            DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
                var testProfile = Profile()
                testProfile.name = "Alex"
                testProfile.rating = Int.random(in: 1...100)
                testProfile.score = Double.random(in: 0...1000)
                print("success")
                promise(.success(testProfile))
            }
            print("Future ends")
        }
        .eraseToAnyPublisher()
    }
}
