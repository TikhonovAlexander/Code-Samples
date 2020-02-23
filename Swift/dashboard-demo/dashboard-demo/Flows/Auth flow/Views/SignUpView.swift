//
//  SignUpView.swift
//  dashboard-demo
//
//  Created by atikhonov on 21.02.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

protocol SignUpView: BaseView {
    var confirmed: Bool { get set }
    var onSignUpComplete: (() -> Void)? { get set }
    var onTermsButtonTap: (() -> Void)? { get set }
    func conformTermsAgreement(_ agree: Bool)
}
