//
//  LaunchConfig.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

struct LaunchConfig {
    @UserDefault("onboarding was shown", defaultValue: false)
    static var onboardingWasShown: Bool
    
    @UserDefault("isAutorized", defaultValue: false)
    static var isAutorized: Bool
}
