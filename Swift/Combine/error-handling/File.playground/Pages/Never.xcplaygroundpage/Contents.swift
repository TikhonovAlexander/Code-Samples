import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

enum MyError: Error {
    case bad
}

example(of: "SetFailureType") {
    Just("Hello SetFailureType")
        .setFailureType(to: MyError.self)
        .sink(receiveCompletion: { completion in
            switch completion {
            case .failure(.bad):
                print("Finished with BAD!")
            case .finished:
                print("Finished successfully!")
            }
        }) { value in
            print("Got value: \(value)")
    }
    .store(in: &subscriptions)
}

example(of: "assertNoFailure") {
    Just("Hello assertNoFailure")
        .setFailureType(to: MyError.self)
        .assertNoFailure()
        .sink(receiveValue:  { print("Got value \($0)") })
        .store(in: &subscriptions)
}
