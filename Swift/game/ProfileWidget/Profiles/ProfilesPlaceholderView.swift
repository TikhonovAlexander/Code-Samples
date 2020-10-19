//
//  ProfilesPlaceholderView.swift
//  ProfileWidgetExtension
//
//  Created by Tikhonov, Aleksandr on 18.10.20.
//

import SwiftUI

struct ProfilesPlaceholderView: View {
    var body: some View {
        ProfilesWidgetEntryView(entry: ProfilesSimpleEntry(date: Date(), profiles: sampleProfiles))
            .redacted(reason: .placeholder)
    }
}

