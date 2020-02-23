//
//  LaunchInstructor.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

enum LaunchInstructor {
    case main
    case auth
    case onboarding
    
    static func configure(onboardingWasShown: Bool, isAutorized: Bool) -> LaunchInstructor {
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
