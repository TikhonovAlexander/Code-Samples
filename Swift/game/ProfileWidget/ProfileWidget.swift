//
//  ProfileWidget.swift
//  ProfileWidget
//
//  Created by Tikhonov, Aleksandr on 28.09.20.
//

import WidgetKit
import SwiftUI

struct ProfileProvider: IntentTimelineProvider {

    func placeholder(in context: Context) -> ProfileSimpleEntry {
        ProfileSimpleEntry(date: Date(), profile: sampleProfile)
    }

    func getSnapshot(for configuration: ProfileSelectionIntent, in context: Context, completion: @escaping (ProfileSimpleEntry) -> ()) {
        let entry = ProfileSimpleEntry(date: Date(), profile: sampleProfile)
        completion(entry)
    }

    func getTimeline(for configuration: ProfileSelectionIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries: [ProfileSimpleEntry] = [ProfileSimpleEntry(date: Date(), profile: profile(for: configuration))]

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }

    func profile(for configuration: ProfileSelectionIntent) -> Profile {
        switch configuration.profile {
        case .lina:
        return Profile(id: 3, name: "Lina", rating: 4, score: 602.1, imageName: "lina")
        case .morphling:
        return Profile(id: 2, name: "Morphling", rating: 2, score: 218.8, imageName: "morphling")
        case .bloodseeker:
        return Profile(id: 1, name: "Bloodseeker", rating: 6, score: 312.1, imageName: "bloodseeker")
        case .unknown:
            return Profile(id: 3, name: "Lina", rating: 4, score: 602.1, imageName: "lina")
        }
    }
}

struct PlaceholderView: View {
    var body: some View {
        ProfileWidgetEntryView(entry: ProfileSimpleEntry(date: Date(), profile: sampleProfile))
            .redacted(reason: .placeholder)
    }
}

struct ProfileSimpleEntry: TimelineEntry {
    let date: Date
    let profile: Profile
}

struct ProfileWidgetEntryView : View {
    var entry: ProfileProvider.Entry

    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            ProfileView(profileViewModel: ProfileViewModel(profile: entry.profile), showImage: false)
        default:
            ProfileView(profileViewModel: ProfileViewModel(profile: entry.profile))
        }
    }
}

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
