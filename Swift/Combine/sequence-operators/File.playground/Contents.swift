import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "min") {
    [1, -50, 246, 0].publisher
        .print()
        .min()
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}
example(of: "max") {
    ["A", "F", "Z", "E"].publisher
        .print()
        .max()
        .sink(receiveValue: { print("Highest value is \($0)") })
        .store(in: &subscriptions)
}

example(of: "first") {
    ["A", "F", "Z", "E"].publisher
        .print()
        .first()
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "last") {
    ["A", "F", "Z", "E"].publisher
        .print()
        .last()
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "output(at:)") {
    ["A", "F", "Z", "E"].publisher
        .print()
        .output(at: 2)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "output(in:)") {
    ["A", "F", "Z", "E", "T", "W"].publisher
        .print()
        .output(in: 1..<3)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "count") {
    ["A", "F", "Z", "E", "T", "W"].publisher
        .print()
        .count()
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "contains") {
    ["A", "F", "Z", "E", "T", "W"].publisher
        .print()
        .contains("R")
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "allSatisfy") {
    [2, 4, 5, 6].publisher
        .print()
        .allSatisfy { $0.isMultiple(of: 2) }
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "reduce") {
    [2, 4, 6].publisher
        .print()
        .reduce(0, +)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}
