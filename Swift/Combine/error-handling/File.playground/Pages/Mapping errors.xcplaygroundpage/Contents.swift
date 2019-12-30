import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "map vs tryMap") {
    enum NameError: Error {
        case tooShort(String)
        case unknown
    }
    Just("Hello")
        .setFailureType(to: NameError.self)
        .tryMap { throw NameError.tooShort($0) }
        .mapError { $0 as? NameError ?? .unknown }
        .sink( receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("Done!")
            case .failure(.tooShort(let name)):
                print("\(name) is too short!")
            case .failure(.unknown):
                print("An unknown name error occurred")
            }
        }, receiveValue: { print("Got value \($0)") }
    )
        .store(in: &subscriptions)
    
}
