import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "Challenge") {
    let numbers = (1...100).publisher
    
    numbers
        .dropFirst(50)
        .prefix(20)
        .filter { $0.isMultiple(of: 2) }
        .sink(receiveCompletion: { print("Completed with: \($0)") }, receiveValue: { print($0) })
        .store(in: &subscriptions)
}
