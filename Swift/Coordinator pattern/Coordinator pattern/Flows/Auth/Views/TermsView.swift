//
//  TermsView.swift
//  Coordinator pattern
//
//  Created by atikhonov on 16.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

protocol TermsView: BaseView {
    var confirmed: Bool { get set }
    var onConfirmChanged: ((Bool) -> ())? { get set }
}
