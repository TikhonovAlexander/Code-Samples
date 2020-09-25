//
//  GameView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 23.09.20.
//

import SwiftUI

struct ProfileView: View {

    @ObservedObject var profileViewModel: ProfileViewModel

    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image(profileViewModel.imageName)
                .resizable()
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
                .overlay(Circle().stroke(Color.red, lineWidth: 4))
                .frame(width: 200, height: 300)
                .shadow(radius: 10)
            VStack(alignment: .leading) {
                Text("Name: \(profileViewModel.name)")
                    .padding(EdgeInsets(top: 4, leading: 2, bottom: 4, trailing: 2))
                    .background(Color.red)
                Text("Rating: \(profileViewModel.rating)")
                    .padding(EdgeInsets(top: 4, leading: 2, bottom: 4, trailing: 2))
                    .background(Color.green)
                Text("Score: \(profileViewModel.score, specifier: "%.1f")")
                    .padding(EdgeInsets(top: 4, leading: 2, bottom: 4, trailing: 2))
                    .background(Color.orange)
            }
        }
    }
}

struct GameViewView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileViewModel: sampleProfileViewModel)
    }
}
