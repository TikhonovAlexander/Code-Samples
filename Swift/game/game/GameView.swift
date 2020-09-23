//
//  GameView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 23.09.20.
//

import SwiftUI

struct GameView: View {

    @ObservedObject var profileViewModel: ProfileViewModel

    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image("lina")
                .resizable()
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
                .overlay(Circle().stroke(Color.red, lineWidth: 4))
                .frame(width: 200, height: 200)
                .shadow(radius: 10)
            VStack(alignment: .leading) {
                Text("Name: \(profileViewModel.profile.name)")
                    .padding()
                    .background(Color.red)
                Text("Rating: \(profileViewModel.profile.rating)")
                    .padding()
                    .background(Color.green)
                Text("Score: \(profileViewModel.profile.score, specifier: "%.1f")")
                    .padding()
                    .background(Color.orange)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20.0, style: .continuous)
                .strokeBorder(Color.black, lineWidth: 4.0)
        )
    }
}

struct GameViewView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(profileViewModel: sampleProfileViewModel)
    }
}
