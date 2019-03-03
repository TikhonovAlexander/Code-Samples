//
//  ATTimelinePresenter.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import Foundation


protocol ATTimelinePresentationLogic {
    func present(response: ATTimelineModel.FetchTimelines.Response, completion: (() -> Void)?)
    func presentLoading(completion: (() -> Void)?)
}

class ATTimelinePresenter: ATTimelinePresentationLogic {
    weak var viewController: ATTimelineDisplayLogic?
    
    // MARK: Presentation logic
    
    func present(response: ATTimelineModel.FetchTimelines.Response, completion: (() -> Void)?) {
        let responseResult = response.result
        let viewModel: ATTimelineModel.FetchTimelines.ViewModel
        switch responseResult {
        case .success(let value):
            if value.isEmpty {
                viewModel = ATTimelineModel.FetchTimelines.ViewModel(state: .emptyResult(title: "Empty Title", subtitle: "Empty Subtitle"))
            } else {
                let sections = value.map(convertSection)
                viewModel = ATTimelineModel.FetchTimelines.ViewModel(state: .result(sections))
            }
        case .failure(let error):
            viewModel = ATTimelineModel.FetchTimelines.ViewModel(state: .error(message: error.localizedDescription))
        }
        viewController?.display(viewModel: viewModel, completion: completion)
    }
    
    func presentLoading(completion: (() -> Void)?) {
        viewController?.display(viewModel: .init(state: .loading), completion: completion)
    }
    
    
    private func convertSection(section: ATTimelineSection) -> ATTimelineTableViewSectionModel {
        let title = section.title
        let cells = section.timelines.map(convertCell)
        return ATTimelineTableViewSectionModel(sectionTitle: title, cells: cells)
    }

    private func convertCell(timeline: ATTimeline) -> ATTimelineTableViewCellModel {
        return ATTimelineTableViewCellModel(title: timeline.title, description: timeline.description)
    }
    
}
