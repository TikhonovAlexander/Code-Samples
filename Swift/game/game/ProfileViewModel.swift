//
//  ProfileViewModel.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 23.09.20.
//

import SwiftUI
import Combine

class ProfileViewModel: ObservableObject  {

    @Published var profile: Profile = .init()

    let service = ProfileService()

    var cancellable: Set<AnyCancellable> = []

    func fetchProfile() {
        service
            .fetchProfile()
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
    
}

var sampleProfileViewModel: ProfileViewModel = {
    var profile = Profile()
    profile.name = "Lina"
    profile.rating = 4
    profile.score = 602.1
    let viewModel = ProfileViewModel()
    viewModel.profile = profile
    return viewModel
}()

