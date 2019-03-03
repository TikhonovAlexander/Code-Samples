//
//  ATDetailInteractor.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import Foundation

protocol ATDetailBusinessLogic {
    func fetch(request: ATDetailModel.FetchDetail.FetchDetailRequest, completion: (() -> Void)?)
}

protocol ATDetailDataStore {
    var timeline: ATTimeline? { get set }
}

class ATDetailInteractor: NSObject, ATDetailBusinessLogic, ATDetailDataStore {
    var presenter: ATDetailPresentationLogic?
    
    var timeline: ATTimeline?
    
    // MARK: Interactor logic
    
    func fetch(request: ATDetailModel.FetchDetail.FetchDetailRequest, completion: (() -> Void)?) {
        let name: String = timeline?.title ?? "Unknown"
        presenter?.present(name: name, completion: completion)
    }
}
