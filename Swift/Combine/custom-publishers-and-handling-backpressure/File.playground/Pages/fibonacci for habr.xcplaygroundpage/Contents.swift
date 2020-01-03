import Foundation
import Combine

struct FibonacciConfiguration {
    var count: Subscribers.Demand
}

struct FibonacciPublisher: Publisher {
    
    typealias Output = Int
    typealias Failure = Never
    
    var configuration: FibonacciConfiguration
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        let subscription = FibonacciSubscription(subscriber: subscriber, configuration: configuration)
        subscriber.receive(subscription: subscription)
    }
    
}

private final class FibonacciSubscription<S: Subscriber>: Subscription where S.Input == Int {
    
    var subscriber: S?
    var configuration: FibonacciConfiguration
    var count: Subscribers.Demand
    var requested: Subscribers.Demand = .none
    
    init(subscriber: S?, configuration: FibonacciConfiguration) {
        self.subscriber = subscriber
        self.configuration = configuration
        self.count = configuration.count
    }
    
    func cancel() {
        subscriber = nil
    }
    
    func request(_ demand: Subscribers.Demand) {
        guard count > .none else {
            subscriber?.receive(completion: .finished)
            return
        }
        requested += demand
        count -= .max(1)
        requested -= .max(1)
        requested += subscriber?.receive(0) ?? .none
        guard let _ = subscriber, requested > .none else { return }
        if count == .none {
            subscriber?.receive(completion: .finished)
            return
        }
        
        count -= .max(1)
        requested -= .max(1)
        requested += subscriber?.receive(1) ?? .none
        guard let _ = subscriber, requested > .none else { return }
        if count == .none {
            subscriber?.receive(completion: .finished)
            return
        }
        
        var prev = 0
        var current = 1
        var temp: Int
        while let subscriber = subscriber, requested > .none {
            temp = prev
            prev = current
            current += temp
            requested += subscriber.receive(current)
            count -= .max(1)
            requested -= .max(1)
            if count == .none {
                subscriber.receive(completion: .finished)
                return
            }
        }
    }
}

extension Publishers {
    private static func fibonacci(configuration: FibonacciConfiguration) -> FibonacciPublisher {
        FibonacciPublisher(configuration: configuration)
    }
    
    static func fibonacci(count: Subscribers.Demand = .max(6)) -> FibonacciPublisher {
        FibonacciPublisher(configuration: FibonacciConfiguration(count: count))
    }
}

class FibonacciSubscriber: Subscriber {
    typealias Input = Int
    typealias Failure = Never
 
    var limit: Subscribers.Demand
    
    init(limit: Subscribers.Demand) {
        self.limit = limit
    }
    
    func receive(subscription: Subscription) {
        subscription.request(limit)
    }

    func receive(_ input: Input) -> Subscribers.Demand {
       .none
    }

    func receive(completion: Subscribers.Completion<Failure>) {
        print("Subscriber's completion: \(completion)")
    }
}

Publishers.fibonacci(count: .max(4))
    .print()
    .sink { _ in }

let subscriber = FibonacciSubscriber(limit: .max(3))
Publishers.fibonacci(count: .max(5))
    .print()
    .subscribe(subscriber)
