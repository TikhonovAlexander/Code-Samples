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
    Profile(id: 1, name: "Bloodseeker", rating: 6, score: 312.1, imageName: "bloodseeker")
}()

var sampleProfiles: [Profile] = {
    let bloodseekerProfile = Profile(id: 1, name: "Bloodseeker", rating: 6, score: 312.1, imageName: "bloodseeker")
    let morphlingProfile = Profile(id: 2, name: "Morphling", rating: 2, score: 218.8, imageName: "morphling")
    let linaProfile = Profile(id: 3, name: "Lina", rating: 4, score: 602.1, imageName: "lina")

    return [bloodseekerProfile, morphlingProfile, linaProfile]
}()
