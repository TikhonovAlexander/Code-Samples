//
//  ATHealthPromptsService.swift
//  ottonova
//
//  Created by atikhonov on 13/02/19
//  Copyright © 2019 atikhonov. All rights reserved.
//

import Foundation

protocol ATProfileService {
    func fetchAllHealthPrompts(request: ATHealthPromptsModel.FetchHealthPrompts.FetchAllRequest, completion: @escaping (ATResult<[ATHealthPrompt]>) -> Void)
    
    func fetchProfile(request: ATProfileModel.FetchProfile.FetchProfileRequest, completion: @escaping (ATResult<ATProfile>) -> Void)
    
    func fetchTimelines(request: ATTimelineModel.FetchTimelines.FetchAllRequest, completion: @escaping (ATResult<[ATTimeline]>) -> Void)
}

class ATProfileMainService: ATProfileService {
    func fetchAllHealthPrompts(request: ATHealthPromptsModel.FetchHealthPrompts.FetchAllRequest, completion: @escaping (ATResult<[ATHealthPrompt]>) -> Void) {
        
        let command = ATFetchAllHealthPromptsCommand(request: request) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        command.execute()
    }
    
    func fetchProfile(request: ATProfileModel.FetchProfile.FetchProfileRequest, completion: @escaping (ATResult<ATProfile>) -> Void) {
        let command = ATFetchAllProfilesCommand(request: request) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        command.execute()
    }
    
    func fetchTimelines(request: ATTimelineModel.FetchTimelines.FetchAllRequest, completion: @escaping (ATResult<[ATTimeline]>) -> Void) {
        let command = ATFetchAllTimelinesCommand(request: request) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        command.execute()
    }
}

class ATProfileStubService: ATProfileService {
    func fetchAllHealthPrompts(request: ATHealthPromptsModel.FetchHealthPrompts.FetchAllRequest, completion: @escaping (ATResult<[ATHealthPrompt]>) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let prompt1 = ATHealthPrompt(id: "1", message: "Swift is a powerful and intuitive programming language for macOS, iOS, watchOS and tvOS")
            let prompt2 = ATHealthPrompt(id: "2", message: "In Swift Playgrounds you create small programs called “playgrounds” that instantly show the results of the code that you write")
            let prompt3 = ATHealthPrompt(id: "3", message: "Swift is the result of the latest research on programming languages, combined with decades of experience building Apple platforms.")
            let prompt4 = ATHealthPrompt(id: "4", message: "Introduced in Swift 3, Swift Package Manager is a cross-platform tool for building Swift libraries and executables, making it easy to create and manage dependencies.")
            let prompt5 = ATHealthPrompt(id: "5", message: "You can create an entirely new application with Swift today, or begin using Swift code to implement new features and functionality in your app. Swift code co-exists along side your existing Objective-C files in the same project, with full access to your Objective-C API, making it easy to adopt.")
            completion(.success([prompt1, prompt2, prompt3, prompt4, prompt5]))
        }
    }
    
    func fetchProfile(request: ATProfileModel.FetchProfile.FetchProfileRequest, completion: @escaping (ATResult<ATProfile>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let profile = ATProfile.init(id: "freemium_profile", name: "Vasa")
            completion(.success(profile))
        }
    }
    
    func fetchTimelines(request: ATTimelineModel.FetchTimelines.FetchAllRequest, completion: @escaping (ATResult<[ATTimeline]>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let date = Date()
            let tl1 = ATTimeline(id: "1", timestamp: date, title: "tl1", description: "tl1 d")
            let tl2 = ATTimeline(id: "2", timestamp: date, title: "tl2", description: "tl2 d")
            let tl3 = ATTimeline(id: "3", timestamp: date, title: "tl3", description: "tl3 d")
            let tl4 = ATTimeline(id: "4", timestamp: date, title: "tl4", description: "tl4 d")
            completion(.success([tl1, tl2, tl3, tl4]))
        }
    }
}
