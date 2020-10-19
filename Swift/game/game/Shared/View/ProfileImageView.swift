//
//  ProfileImageView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 18.10.20.
//

import SwiftUI

struct ProfileImageView: View {

    let profile: Profile

    var body: some View {
        Image(profile.imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.red, lineWidth: 2))
            .shadow(radius: 10)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(profile: sampleProfile)
    }
}
