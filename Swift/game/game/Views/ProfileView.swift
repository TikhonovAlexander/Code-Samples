//
//  GameView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 23.09.20.
//

import SwiftUI

struct ProfileView: View {

    @EnvironmentObject private var store: AppStore

    let profileId: Int

    var showImage: Bool = true

    var profile: Profile {
        store.state.profilesState.profiles[profileId]!
    }

    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            if showImage {
                Image(profile.imageName)
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
                    .overlay(Circle().stroke(Color.red, lineWidth: 4))
                    .frame(width: 200, height: 200)
                    .shadow(radius: 10)
            }
            VStack(alignment: .leading) {
                Text("Name: \(profile.name)")
                    .padding(EdgeInsets(top: 4, leading: 2, bottom: 4, trailing: 2))
                Text("Rating: \(profile.rating)")
                    .padding(EdgeInsets(top: 4, leading: 2, bottom: 4, trailing: 2))
                Text("Score: \(profile.score, specifier: "%.1f")")
                    .padding(EdgeInsets(top: 4, leading: 2, bottom: 4, trailing: 2))
            }
        }
    }
}

struct GameViewView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileId: 1)
            .environmentObject(sampleStore)
    }
}
