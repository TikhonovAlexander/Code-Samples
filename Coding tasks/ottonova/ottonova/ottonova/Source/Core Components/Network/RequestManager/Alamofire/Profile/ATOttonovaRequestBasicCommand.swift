//
//  ATOttonovaRequestBasicCommand.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright © 2019 atikhonov. All rights reserved.
//

import Foundation

protocol ATOttonovaRequestBasicCommand: ATRequestBasicCommand {}

extension ATOttonovaRequestBasicCommand {
    var baseURL: String {
        return "https://freemium.ottonova.de/api"
    }
}
