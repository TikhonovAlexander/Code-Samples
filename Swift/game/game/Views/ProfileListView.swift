//
//  ProfileListView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 24.09.20.
//

import SwiftUI

struct ProfileListView: View {

    @ObservedObject var profilesViewModel: ProfilesViewModel

    var body: some View {
        NavigationView {
            List(profilesViewModel.profiles) { profile in
                NavigationLink( destination: ContainerProfileView(profileViewModel: ProfileViewModel(profile: profile), profileId: profile.id)) {
                    ProfileView(profileViewModel: ProfileViewModel(profile: profile))
                }
            }
            .navigationBarTitle(Text("Profiles"))
            .onAppear {
                fetchProfiles()
            }
        }
    }

    private func fetchProfiles() {
        profilesViewModel.fetchProfiles()
    }
}

struct ProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListView(profilesViewModel: sampleProfilesViewModel)
    }
}
