//
//  ContainerProfileView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 23.09.20.
//

import SwiftUI
import Combine

struct ContainerProfileView: View {

    @EnvironmentObject private var store: AppStore

    let profileId: Int

    var body: some View {
        VStack {
            ProfileView(profileId: profileId)
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
        let action = ProfilesActions.FetchProfile(profileId: profileId)
        store.send(action: .profiles(action: action))
    }
}

struct ContainerGameView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerProfileView(profileId: 1)
            .environmentObject(sampleStore)
    }
}
