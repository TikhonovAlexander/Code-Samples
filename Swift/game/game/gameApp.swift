//
//  gameApp.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 23.09.20.
//

import SwiftUI

@main
struct gameApp: App {

    @StateObject var appStore = AppStore(state: .init(), reducer: appReducer(state:action:))

    var body: some Scene {
        WindowGroup {
            ProfileListView()
                .environmentObject(appStore)
        }
    }
}
