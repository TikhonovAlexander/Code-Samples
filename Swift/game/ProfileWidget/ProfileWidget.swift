//
//  ProfileWidget.swift
//  ProfileWidget
//
//  Created by Tikhonov, Aleksandr on 28.09.20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), profile: sampleProfile)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), profile: sampleProfile)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [SimpleEntry] = [SimpleEntry(date: Date(), profile: sampleProfile)]

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct PlaceholderView: View {
    var body: some View {
        ProfileWidgetEntryView(entry: SimpleEntry(date: Date(), profile: sampleProfile))
            .redacted(reason: .placeholder)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let profile: Profile
}

struct ProfileWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ProfileView(profileViewModel: ProfileViewModel(profile: entry.profile))
    }
}

@main
struct ProfileWidget: Widget {
    let kind: String = "ProfileWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ProfileWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Profile Widget")
        .description("Keep track of your profiles.")
        .supportedFamilies([.systemMedium])
    }
}

struct ProfileWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileWidgetEntryView(entry: SimpleEntry(date: Date(), profile: sampleProfile))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            PlaceholderView()
                .previewContext(WidgetPreviewContext(family: .systemMedium))
        }
    }
}
