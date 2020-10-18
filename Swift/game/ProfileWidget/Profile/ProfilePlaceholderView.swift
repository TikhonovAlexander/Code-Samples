//
//  ProfilePlaceholderView.swift
//  ProfileWidgetExtension
//
//  Created by Tikhonov, Aleksandr on 18.10.20.
//

import SwiftUI

struct PlaceholderView: View {
    var body: some View {
        ProfileWidgetEntryView(entry: ProfileSimpleEntry(date: Date(), profile: sampleProfile))
            .redacted(reason: .placeholder)
    }
}
