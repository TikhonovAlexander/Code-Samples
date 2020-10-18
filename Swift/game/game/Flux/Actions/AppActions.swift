//
//  AppActions.swift
//  game
//
//  Created by atikhonov on 25.08.2020.
//

import Foundation

protocol Action {}

enum AppAction {
    case profiles(action: ProfileAction)
}

