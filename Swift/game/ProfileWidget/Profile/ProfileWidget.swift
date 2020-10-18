//
//  ProfileWidget.swift
//  ProfileWidget
//
//  Created by Tikhonov, Aleksandr on 28.09.20.
//

import WidgetKit
import SwiftUI

struct ProfileWidget: Widget {
    let kind: String = "ProfileWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ProfileSelectionIntent.self, provider: ProfileProvider()) { entry in
            ProfileWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Profile Widget")
        .description("Your favorite profile.")
        .supportedFamilies([.systemMedium, .systemSmall])
    }
}

struct ProfileWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileWidgetEntryView(entry: ProfileSimpleEntry(date: Date(), profile: sampleProfile))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            ProfileWidgetEntryView(entry: ProfileSimpleEntry(date: Date(), profile: sampleProfile))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            PlaceholderView()
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}
