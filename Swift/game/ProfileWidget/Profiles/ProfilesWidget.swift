//
//  ProfilesWidget.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 29.09.20.
//

import WidgetKit
import SwiftUI

struct ProfilesWidget: Widget {
    let kind: String = "ProfilesWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ProfilesProvider()) { entry in
            ProfilesWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Profiles Widget")
        .description("Keep track of your profiles.")
        .supportedFamilies([.systemLarge])
    }
}

struct ProfilesWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfilesWidgetEntryView(entry: ProfilesSimpleEntry(date: Date(), profiles: sampleProfiles))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}

