//
//  ProfileViewModel.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 23.09.20.
//

import SwiftUI
import Combine

class ProfileViewModel: ObservableObject, Identifiable  {

    private let service = ProfileService()
    private var cancellable: Set<AnyCancellable> = []

    private var profile: Profile {
        didSet {
            updateProperties()
        }
    }

    @Published var name: String = ""
    @Published var rating: Int = 0
    @Published var score: Double = 0
    @Published var imageName: String = ""

    init(profile: Profile) {
        self.profile = profile
        updateProperties()
    }

    func fetchProfile(id: Int) {
        service
            .fetchProfile(for: id)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error)
                }
            } receiveValue: { profile in
                self.profile = profile
            }
            .store(in: &cancellable)
    }

    private func updateProperties() {
        name = profile.name
        rating = profile.rating
        score = profile.score
        imageName = profile.imageName
    }
    
}

var sampleProfileViewModel: ProfileViewModel = {
    let profile = Profile(id: 3, name: "Lina", rating: 4, score: 602.1, imageName: "lina")
    let viewModel = ProfileViewModel(profile: profile)
    return viewModel
}()
