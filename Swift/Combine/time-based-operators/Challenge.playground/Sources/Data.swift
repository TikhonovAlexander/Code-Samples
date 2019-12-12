import Combine
import Foundation

// sample data!
let samples: [(TimeInterval, Int)] = [
    (0.05, 67), (0.10, 111), (0.15, 109), (0.20, 98), (0.25, 105), (0.30, 110), (0.35, 101),
    (1.50, 105), (1.55, 115),
    (2.60, 99), (2.65, 111), (2.70, 111), (2.75, 108), (2.80, 33)
]

public func startFeeding<S>(subject: S) where S: Subject, S.Output == Int {
    var lastDelay: TimeInterval = 0
    for entry in samples {
        lastDelay = entry.0
        DispatchQueue.main.asyncAfter(deadline: .now() + entry.0) {
            subject.send(entry.1)
        }
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + lastDelay + 0.5) {
        subject.send(completion: .finished)
    }
}
