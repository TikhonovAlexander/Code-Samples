//
//  ContainerGameView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 23.09.20.
//

import SwiftUI
import Combine

struct ContainerGameView: View {

    @ObservedObject var profileViewModel = ProfileViewModel()

    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack {
                GameView(profileViewModel: profileViewModel)
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
        profileViewModel.fetchProfile()
    }


}

struct ContainerGameView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerGameView(profileViewModel: sampleProfileViewModel)
    }
}
