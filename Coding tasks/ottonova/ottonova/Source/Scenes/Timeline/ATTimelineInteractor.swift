//
//  ATTimelineInteractor.swift
//  ottonova
//
//  Created by atikhonov on 13/02/2019.
//  Copyright (c) 2019 atikhonov. All rights reserved.

import Foundation

protocol ATTimelineBusinessLogic {
    func fetch(request: ATTimelineModel.FetchTimelines.FetchAllRequest, completion: (() -> Void)?)
    func selectedTimeline(at indexPath: IndexPath)
}

protocol ATTimelineDataStore {
    var selectedTimeline: ATTimeline? { get set }
}

class ATTimelineInteractor: NSObject, ATTimelineBusinessLogic, ATTimelineDataStore {
    var presenter: ATTimelinePresentationLogic?
    
    var selectedTimeline: ATTimeline?
    var timelineSections: [ATTimelineSection]?
    
    let healthPromptsService: ATProfileService = ATProfileMainService()
    
    // MARK: Interactor logic
    
    func fetch(request: ATTimelineModel.FetchTimelines.FetchAllRequest, completion: (() -> Void)?) {
        presenter?.presentLoading(completion: nil)
        healthPromptsService.fetchTimelines(request: request) { (result) in
            let response: ATTimelineModel.FetchTimelines.Response
            if case let .success(timelines) = result {
                let timelineSections = self.combineTimelines(timelines: timelines)
                response = ATTimelineModel.FetchTimelines.Response(result: .success(timelineSections))
                self.timelineSections = timelineSections
            } else {
                response = ATTimelineModel.FetchTimelines.Response(result: .failure(result.error!))
            }
            self.presenter?.present(response: response, completion: completion)
        }
    }
    
    func selectedTimeline(at indexPath: IndexPath) {
        guard let timelineSections = timelineSections else { return }
        let section = timelineSections[indexPath.section]
        let timelines = section.timelines
        selectedTimeline = timelines[indexPath.row]
    }
    
    private func combineTimelines(timelines: [ATTimeline]) -> [ATTimelineSection] {
        let calendar = Calendar.current
        var dict = [DateComponents : [ATTimeline]]()
        for timeline in timelines {
            let components = calendar.dateComponents([.day, .month, .year], from: timeline.timestamp)
            var array = dict[components, default: []]
            array.append(timeline)
            dict[components] = array
        }
        var sections: [ATTimelineSection] = []
        for (key, value) in dict {
            // should avoid implicity unwrapping
            let sectionTitle = "\(key.year!).\(key.month!).\(key.day!)"
            let section = ATTimelineSection(title: sectionTitle, timelines: value)
            sections.append(section)
        }
        return sections
    }
}

