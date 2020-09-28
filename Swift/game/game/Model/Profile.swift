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

var sampleProfile: Profile = {
    let profile = Profile(id: 3, name: "Lina", rating: 4, score: 602.1, imageName: "lina")
    return profile
}()
