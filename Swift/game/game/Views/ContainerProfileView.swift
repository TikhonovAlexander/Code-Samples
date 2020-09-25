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
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack {
                ProfileView(profileViewModel: profileViewModel)
                Button.init(action: {
                    self.fetchProfile()
                }, label: {
                    Text("Update Profile")
                        .foregroundColor(.white)
                })
                .padding()
                .background(Color.purple)
                .cornerRadius(10.0)
            }
        }
        .onAppear {
            fetchProfile()
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
