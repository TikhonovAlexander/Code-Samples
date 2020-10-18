//
//  AppStore.swift
//  game
//
//  Created by atikhonov on 05.09.2020.
//

import Foundation

typealias AppStore = Store<AppState, AppAction>

var sampleStore: AppStore = {
    AppStore(state: sampleAppState, reducer: appReducer(state:action:))
}()
