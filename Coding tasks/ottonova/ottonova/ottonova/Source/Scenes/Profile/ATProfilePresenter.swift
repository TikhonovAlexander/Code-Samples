//
//  ATProfilePresenter.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import Foundation

protocol ATProfilePresentationLogic {
    func present(response: ATProfileModel.FetchProfile.Response, completion: (() -> Void)?)
    func presentLoading(completion: (() -> Void)?)
}

class ATProfilePresenter: ATProfilePresentationLogic {
    weak var viewController: ATProfileDisplayLogic?
    
    // MARK: Presentation logic
    
    func present(response: ATProfileModel.FetchProfile.Response, completion: (() -> Void)?) {
        let responseResult = response.result
        let viewModel: ATProfileModel.FetchProfile.ViewModel
        switch responseResult {
        case .success:
            viewModel = ATProfileModel.FetchProfile.ViewModel(state: .result)
        case .failure(let error):
            viewModel = ATProfileModel.FetchProfile.ViewModel(state: .error(message: error.localizedDescription))
        }
        viewController?.display(viewModel: viewModel, completion: completion)
    }
    
    func presentLoading(completion: (() -> Void)?) {
        viewController?.display(viewModel: .init(state: .loading), completion: completion)
    }
}
