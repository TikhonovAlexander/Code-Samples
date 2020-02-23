//
//  OnboardingFinalView.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

protocol OnboardingFinalView: BaseView {
    var onFinish: (() -> Void)? { get set }
}
