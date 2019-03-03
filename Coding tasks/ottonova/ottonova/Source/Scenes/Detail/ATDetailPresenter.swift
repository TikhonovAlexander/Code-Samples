//
//  ATDetailPresenter.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import Foundation

protocol ATDetailPresentationLogic {
    func present(name: String, completion: (() -> Void)?)
}

class ATDetailPresenter: ATDetailPresentationLogic {
    weak var viewController: ATDetailDisplayLogic?
    
    // MARK: Presentation logic
    
    func present(name: String, completion: (() -> Void)?) {
        viewController?.display(viewModel: .init(state: .result(name: name)), completion: completion)
    }
    
}
