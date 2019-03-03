//
//  ATProfileInteractor.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import Foundation

protocol ATProfileBusinessLogic {
    func fetch(request: ATProfileModel.FetchProfile.FetchProfileRequest, completion: (() -> Void)?)
}

protocol ATProfileDataStore {
    var profile: ATProfile? { get set }
}

class ATProfileInteractor: NSObject, ATProfileBusinessLogic, ATProfileDataStore {
    var presenter: ATProfilePresentationLogic?
    
    var profile: ATProfile?
    let healthPromptsService: ATProfileService = ATProfileMainService()
    
    // MARK: Interactor logic
    
    func fetch(request: ATProfileModel.FetchProfile.FetchProfileRequest, completion: (() -> Void)?) {
        presenter?.presentLoading(completion: nil)
        healthPromptsService.fetchProfile(request: request) { result in
            if case let .success(profile) = result {
                self.profile = profile
            }
            let response = ATProfileModel.FetchProfile.Response(result: result)
            self.presenter?.present(response: response, completion: completion)
        }
    }
}
