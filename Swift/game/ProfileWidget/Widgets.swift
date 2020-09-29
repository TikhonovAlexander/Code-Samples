//
//  Widgets.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 29.09.20.
//

import SwiftUI

@main
struct ProfileBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        ProfileWidget()
        ProfilesWidget()
    }
}
