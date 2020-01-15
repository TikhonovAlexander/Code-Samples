//
//  LaunchInstructor.swift
//  Coordinator pattern
//
//  Created by atikhonov on 15.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

enum LaunchInstructor {
    case main
    case auth
    case onboarding
    
    func configure(onboardingWasShown: Bool, isAutorized: Bool) -> LaunchInstructor {
        switch (onboardingWasShown, isAutorized) {
        case (false, false):
            return .auth
        case (true, false):
            return .auth
        case (false, true):
            return .onboarding
        case (true, true):
            return .main
        }
    }
}
