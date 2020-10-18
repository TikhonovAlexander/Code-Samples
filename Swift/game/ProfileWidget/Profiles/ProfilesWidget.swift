//
//  ProfilesWidget.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 29.09.20.
//

import WidgetKit
import SwiftUI

struct ProfilesProvider: TimelineProvider {

    func placeholder(in context: Context) -> ProfilesSimpleEntry {
        ProfilesSimpleEntry(date: Date(), profile: sampleProfile)
    }

    func getSnapshot(in context: Context, completion: @escaping (ProfilesSimpleEntry) -> ()) {
        let entry = ProfilesSimpleEntry(date: Date(), profile: sampleProfile)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [ProfilesSimpleEntry] = [ProfilesSimpleEntry(date: Date(), profile: Profile(id: 3, name: "Lina", rating: 4, score: 602.1, imageName: "lina"))]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct ProfilesSimpleEntry: TimelineEntry {
    let date: Date
    let profile: Profile
}

struct ProfilesWidgetEntryView : View {
    var entry: ProfilesProvider.Entry

    var body: some View {
        ProfileListWidgetView(profilesViewModel: sampleProfilesViewModel)
    }
}

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
            ProfilesWidgetEntryView(entry: ProfilesSimpleEntry(date: Date(), profile: sampleProfile))
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}

