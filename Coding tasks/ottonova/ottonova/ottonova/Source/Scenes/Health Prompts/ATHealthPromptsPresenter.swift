//
//  ATHealthPromptsPresenter.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import Foundation

protocol ATHealthPromptsPresentationLogic {
    func present(response: ATHealthPromptsModel.FetchHealthPrompts.Response, completion: (() -> Void)?)
    func presentLoading(completion: (() -> Void)?)
}

class ATHealthPromptsPresenter: ATHealthPromptsPresentationLogic {
    weak var viewController: ATHealthPromptsDisplayLogic?
    
    // MARK: Presentation logic
    
    func present(response: ATHealthPromptsModel.FetchHealthPrompts.Response, completion: (() -> Void)?) {
        let responseResult = response.result
        let viewModel: ATHealthPromptsModel.FetchHealthPrompts.ViewModel
        switch responseResult {
        case .success(let value):
            let models = value.map { ATHealthPromptsCollectionViewCellModel(title: $0.message) }
            if models.isEmpty {
                viewModel = ATHealthPromptsModel.FetchHealthPrompts.ViewModel(state: .emptyResult(title: "Empty Title", subtitle: "Empty Subtitle"))
            } else {
                viewModel = ATHealthPromptsModel.FetchHealthPrompts.ViewModel(state: .result(models))
            }
        case .failure(let error):
            viewModel = ATHealthPromptsModel.FetchHealthPrompts.ViewModel(state: .error(message: error.localizedDescription))
        }
        viewController?.display(viewModel: viewModel, completion: completion)
    }
    
    func presentLoading(completion: (() -> Void)?) {
        viewController?.display(viewModel: .init(state: .loading), completion: completion)
    }
}
