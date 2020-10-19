//
//  ProfileShortInfoView.swift
//  ProfileWidgetExtension
//
//  Created by Tikhonov, Aleksandr on 18.10.20.
//

import SwiftUI
import WidgetKit

struct ProfileShortInfoView: View {

    let profile: Profile

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Name:")
                Text("Rating:")
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(profile.name)
                Text("\(profile.rating)")
            }
        }
        .font(.headline)
    }
}

struct ProfileShortInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileShortInfoView(profile: sampleProfile)
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
