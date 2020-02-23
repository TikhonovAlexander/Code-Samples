//
//  UserData.swift
//  Landmarks
//
//  Created by atikhonov on 21.08.2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}

