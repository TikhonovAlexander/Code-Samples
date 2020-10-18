//
//  ContainerProfileView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 23.09.20.
//

import SwiftUI
import Combine

struct ContainerProfileView: View {

    @ObservedObject var profileViewModel: ProfileViewModel

    var profileId: Int

    var body: some View {
        VStack {
            ProfileView(profileViewModel: profileViewModel)
            Button(action: {
                self.fetchProfile()
            }, label: {
                Text("Update Profile")
            })
            .padding()
            .cornerRadius(10.0)
        }
    }

    private func fetchProfile() {
        profileViewModel.fetchProfile(id: profileId)
    }
}

struct ContainerGameView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerProfileView(profileViewModel: sampleProfileViewModel, profileId: 3)
    }
}
