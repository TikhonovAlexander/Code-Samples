import Foundation
import Combine
import SwiftUI

class ReaderViewModel: ObservableObject {
    private let api = API()
    @Published private var allStories = [Story]()
    @Published var error: API.Error? = nil
    
    @Published var filter = [String]()
    private var subscriptions = Set<AnyCancellable>()
    
    var stories: [Story] {
        guard !filter.isEmpty else {
            return allStories
        }
        return allStories
            .filter { story -> Bool in
                return filter.reduce(false) { isMatch, keyword -> Bool in
                    return isMatch || story.title.lowercased().contains(keyword)
                }
        }
    }
    
    
    func fetchStories() {
        api
            .stories()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { comletion in
                if case .failure(let error) = comletion {
                    self.error = error
                }
            }) { stories in
                self.allStories = stories
                self.error = nil
            }
            .store(in: &subscriptions)
    }
}
