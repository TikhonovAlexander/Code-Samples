import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "tryMap") {
    enum NameError: Error {
        case tooShort(String)
        case unknown
    }
    
    let names = ["Scott", "Marin", "Shai", "Florent"].publisher
    
    names
        .tryMap { value -> Int in
            let length = value.count
            guard length >= 5 else { throw NameError.tooShort(value) }
            return value.count
    }
    .sink(receiveCompletion: { print("Completed with \($0)") }, receiveValue: { print("Got value: \($0)") })
    
    
}
