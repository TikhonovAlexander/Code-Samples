//
//  ProfilesWidgetEntryView.swift
//  ProfileWidgetExtension
//
//  Created by Tikhonov, Aleksandr on 18.10.20.
//

import SwiftUI

struct ProfilesWidgetEntryView : View {
    var entry: ProfilesProvider.Entry

    var body: some View {
        ProfileListWidgetView(profiles: entry.profiles)
    }
}
