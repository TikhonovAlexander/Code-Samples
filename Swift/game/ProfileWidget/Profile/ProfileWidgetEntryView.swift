//
//  ProfileWidgetEntryView.swift
//  ProfileWidgetExtension
//
//  Created by Tikhonov, Aleksandr on 18.10.20.
//

import SwiftUI

struct ProfileWidgetEntryView : View {
    var entry: ProfileProvider.Entry

    @Environment(\.widgetFamily) var family

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            ProfileView(profile: entry.profile)
        default:
            ProfileView(profile: entry.profile)
        }
    }
}
