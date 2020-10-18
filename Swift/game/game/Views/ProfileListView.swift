//
//  ProfileListView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 24.09.20.
//

import SwiftUI

struct ProfileListView: View {

    @ObservedObject var profilesViewModel: ProfilesViewModel

    @ViewBuilder
    var body: some View {
        NavigationView {
            if profilesViewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .red))
            } else {
                List(profilesViewModel.profiles) { profile in
                    NavigationLink( destination: ContainerProfileView(profileViewModel: ProfileViewModel(profile: profile), profileId: profile.id)) {
                        ProfileView(profileViewModel: ProfileViewModel(profile: profile))
                    }
                }
                .navigationBarTitle(Text("Profiles"))
            }
        }
    }
}

struct ProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListView(profilesViewModel: sampleProfilesViewModel)
    }
}
