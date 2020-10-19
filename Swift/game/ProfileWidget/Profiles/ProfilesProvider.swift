//
//  ProfilesProvider.swift
//  ProfileWidgetExtension
//
//  Created by Tikhonov, Aleksandr on 18.10.20.
//

import WidgetKit

struct ProfilesProvider: TimelineProvider {

    func placeholder(in context: Context) -> ProfilesSimpleEntry {
        ProfilesSimpleEntry(date: Date(), profiles: sampleProfiles)
    }

    func getSnapshot(in context: Context, completion: @escaping (ProfilesSimpleEntry) -> ()) {
        let entry = ProfilesSimpleEntry(date: Date(), profiles: sampleProfiles)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<ProfilesSimpleEntry>) -> ()) {
        let entries: [ProfilesSimpleEntry] = [ProfilesSimpleEntry(date: Date(), profiles: sampleProfiles)]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
