import Foundation
import Combine

final class ComputationSubscription<Output>: Subscription {
    private let duration: TimeInterval
    private let sendCompletion: () -> Void
    private let sendValue: (Output) -> Subscribers.Demand
    private let finalValue: Output
    private var cancelled = false
    
    init(duration: TimeInterval, sendCompletion: @escaping () -> Void, sendValue: @escaping (Output) -> Subscribers.Demand, finalValue: Output) {
        self.duration = duration
        self.finalValue = finalValue
        self.sendCompletion = sendCompletion
        self.sendValue = sendValue
    }
    
    func request(_ demand: Subscribers.Demand) {
        if !cancelled {
            print("Beginning expensive computation on thread \(Thread.current.number)")
        }
        Thread.sleep(until: Date(timeIntervalSinceNow: duration))
        if !cancelled {
            print("Completed expensive computation on thread \(Thread.current.number)")
            _ = self.sendValue(self.finalValue)
            self.sendCompletion()
        }
    }
    
    func cancel() {
        cancelled = true
    }
}

extension Publishers {
    
    public struct ExpensiveComputation: Publisher {
        public typealias Output = String
        public typealias Failure = Never
        
        public let duration: TimeInterval
        
        public init(duration: TimeInterval) {
            self.duration = duration
        }
        
        public func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
            Swift.print("ExpensiveComputation subscriber received on thread \(Thread.current.number)")
            let subscription = ComputationSubscription(duration: duration,
                                                       sendCompletion: { subscriber.receive(completion: .finished) },
                                                       sendValue: { subscriber.receive($0) },
                                                       finalValue: "Computation complete")
            
            subscriber.receive(subscription: subscription)
        }
    }
}
