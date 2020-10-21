//
//  ProfileListView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 24.09.20.
//

import SwiftUI
import Combine

struct ProfileListView: View {

    @EnvironmentObject private var store: AppStore

    private var profiles: [Profile] {
        store.state.profilesState.profiles.map { $0.value }
    }

    @State private var showingReadAlert = false
    @State private var showingStoreAlert = false
    @State private var secret: String?

    @ViewBuilder
    var body: some View {
        NavigationView {
            List(profiles) { profile in
                NavigationLink(destination: ContainerProfileView(profileId: profile.id)) {
                    ProfileView(profile: profile)
                }
            }
            .navigationBarTitle(Text("Profiles"))
            .navigationBarItems(trailing:
                                    HStack {
                                        Button("Store") {
                                            _ = KeychainStore.roundTrip("My Secret")
                                            showingStoreAlert = true
                                        }
                                        .alert(isPresented: $showingStoreAlert) {
                                            Alert(title: Text("key saved"))
                                        }
                                        Button("Read") {
                                            secret = KeychainStore.read()
                                            showingReadAlert = true
                                        }
                                        .alert(isPresented: $showingReadAlert) {
                                            Alert(title: Text(secret ?? "key not saved"))
                                        }
                                    }
            )
        }.onAppear {
            fetchProfiles()
        }
    }

    private func fetchProfiles() {
        let action = ProfilesActions.FetchAllProfiles()
        store.send(action: .profiles(action: action))
    }
}

struct ProfileListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListView()
            .environmentObject(sampleStore)
    }
}
