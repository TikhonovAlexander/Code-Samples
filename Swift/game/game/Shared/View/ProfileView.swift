//
//  ProfileView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 23.09.20.
//

import SwiftUI

struct ProfileView: View {

    let profile: Profile

    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            ProfileImageView(profile: profile)
            ProfileInfoView(profile: profile)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profile: sampleProfile)
    }
}
