//
//  ProfileInfoView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 18.10.20.
//

import SwiftUI

struct ProfileInfoView: View {

    let profile: Profile

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Name:")
                Text("Rating:")
                Text("Score:")
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(profile.name)
                Text("\(profile.rating)")
                Text("\(profile.score, specifier: "%.1f")")
            }
        }
        .font(.headline)
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView(profile: sampleProfile)
    }
}
