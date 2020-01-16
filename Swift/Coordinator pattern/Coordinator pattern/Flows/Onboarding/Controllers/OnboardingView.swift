//
//  OnboardingView.swift
//  Coordinator pattern
//
//  Created by atikhonov on 16.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

protocol OnboardingView: BaseView {
    var onNext: (() -> Void)? { get set }
}
