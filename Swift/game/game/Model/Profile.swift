//
//  Profile.swift
//  game
//
//  Created by Tikhonov, Aleksandr on 23.09.20.
//

import SwiftUI
import Combine

struct Profile {
    var id: Int
    var name: String
    var rating: Int
    var score: Double
    var imageName: String
}

extension Profile: Identifiable {} 
