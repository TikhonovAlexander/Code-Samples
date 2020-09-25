//
//  ProfilesViewModel.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 25.09.20.
//

import Foundation
import Combine

class ProfilesViewModel: ObservableObject  {

    @Published var profiles: [Profile] = []

    private let service = ProfileService()

    private var cancellable: Set<AnyCancellable> = []

    func fetchProfiles() {
        service
            .fetchProfiles()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error)
                }
            } receiveValue: { profiles in
                self.profiles = profiles
            }
            .store(in: &cancellable)
    }

}

var sampleProfilesViewModel: ProfilesViewModel = {

    let bloodseekerProfile = Profile(id: 1, name: "Bloodseeker", rating: 6, score: 312.1, imageName: "bloodseeker")

    let morphlingProfile = Profile(id: 2, name: "Morphling", rating: 2, score: 218.8, imageName: "morphling")

    let linaProfile = Profile(id: 3, name: "Lina", rating: 4, score: 602.1, imageName: "lina")

    let viewModel = ProfilesViewModel()
    viewModel.profiles = [bloodseekerProfile, morphlingProfile, linaProfile]

    return viewModel
}()
