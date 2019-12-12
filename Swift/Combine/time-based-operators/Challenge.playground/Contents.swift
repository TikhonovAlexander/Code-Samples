import Combine
import Foundation

// A subject you get values from
let subject = PassthroughSubject<Int, Never>()

let strings = subject
    .collect(.byTime(DispatchQueue.main, .seconds(0.5)))
    .map { String($0.map { Character(Unicode.Scalar($0)!) }) }
    .eraseToAnyPublisher()

let delaySubject = subject.measureInterval(using: DispatchQueue.main)
    .map { interval in interval > 0.9 ? "+" : ""}
    .eraseToAnyPublisher()

let subscription = strings
    .merge(with: delaySubject)
    .filter { !$0.isEmpty }
    .sink { print($0) }

startFeeding(subject: subject)
