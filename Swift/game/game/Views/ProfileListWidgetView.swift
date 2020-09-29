//
//  ProfileListWidgetView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 29.09.20.
//

import SwiftUI

struct ProfileListWidgetView: View {

    @ObservedObject var profilesViewModel: ProfilesViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(profilesViewModel.profiles) { profile in
                HStack(alignment: .center, spacing: 4) {
                    Image(profile.imageName)
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .overlay(Circle().stroke(Color.red, lineWidth: 4))
                        .frame(width: 80, height: 80)
                        .shadow(radius: 10)
                    VStack(alignment: .leading) {
                        Text("Name: \(profile.name)")
                        Text("Rating: \(profile.rating)")
                    }
                }
            }
        }
    }
}

struct ProfileListWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListWidgetView(profilesViewModel: sampleProfilesViewModel)
    }
}
