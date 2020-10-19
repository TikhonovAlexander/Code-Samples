//
//  ProfileListWidgetView.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 29.09.20.
//

import SwiftUI
import WidgetKit

struct ProfileListWidgetView: View {

    let profiles: [Profile]

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(profiles) { profile in
                HStack(alignment: .center) {
                    ProfileImageView(profile: profile)
                    ProfileShortInfoView(profile: profile)
                }
            }
        }
    }
}

struct ProfileListWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListWidgetView(profiles: sampleProfiles)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
