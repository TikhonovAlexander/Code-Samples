//
//  ATHealthPromptsInteractor.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import Foundation

protocol ATHealthPromptsBusinessLogic {
    func fetch(request: ATHealthPromptsModel.FetchHealthPrompts.FetchAllRequest, completion: (() -> Void)?)
}

protocol ATHealthPromptsDataStore {}

class ATHealthPromptsInteractor: NSObject, ATHealthPromptsBusinessLogic, ATHealthPromptsDataStore {
    var presenter: ATHealthPromptsPresentationLogic?
    
    let healthPromptsService: ATProfileService = ATProfileMainService()
    
    // MARK: Interactor logic
    
    func fetch(request: ATHealthPromptsModel.FetchHealthPrompts.FetchAllRequest, completion: (() -> Void)?) {
        presenter?.presentLoading(completion: nil)
        healthPromptsService.fetchAllHealthPrompts(request: request) { (result) in
            let response = ATHealthPromptsModel.FetchHealthPrompts.Response(result: result)
            self.presenter?.present(response: response, completion: completion)
        }
    }
    
}
