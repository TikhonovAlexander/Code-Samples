//
//  OnboardingCoordinatorOutput.swift
//  Coordinator pattern
//
//  Created by atikhonov on 15.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

protocol OnboardingCoordinatorOutput: class {
    var finishFlow: (() -> Void)? { get set }
}
