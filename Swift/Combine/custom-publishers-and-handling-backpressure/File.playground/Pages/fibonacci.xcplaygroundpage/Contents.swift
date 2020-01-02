import Foundation
import Combine

var str = "Hello, playground"

struct FibonacciSubscriber: Subscriber {
    typealias Input = Int
    typealias Failure = Never
 
    var limit: Int
    
    func receive(subscription: Subscription) {
        subscription.request(.max(limit))
    }

    func receive(_ input: Input) -> Subscribers.Demand {
        input == 2 ? .max(1) : .none
    }

    func receive(completion: Subscribers.Completion<Failure>) {
        print("Subscriber's completion: \(completion)")
    }
    var combineIdentifier: CombineIdentifier {
        CombineIdentifier()
    }
}

struct FibonacciConfiguration {
    var times: Subscribers.Demand
}

struct FibonacciPublisher: Publisher {
    
    typealias Output = Int
    typealias Failure = Never
    
    var configuration: FibonacciConfiguration
    init(configuration: FibonacciConfiguration) {
        self.configuration = configuration
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        let subscription = FibonacciSubscription(subscriber: subscriber, configuration: configuration)
        subscriber.receive(subscription: subscription)
    }
    
}

private final class FibonacciSubscription<S: Subscriber>: Subscription where S.Input == Int {
    
    var subscriber: S?
    var configuration: FibonacciConfiguration
    var times: Subscribers.Demand
    var requested: Subscribers.Demand = .none
    
    init(subscriber: S?, configuration: FibonacciConfiguration) {
        self.subscriber = subscriber
        self.configuration = configuration
        self.times = configuration.times
    }
    
    func cancel() {
        subscriber = nil
    }
    
    func request(_ demand: Subscribers.Demand) {
        demand
        guard times > .none else {
            subscriber?.receive(completion: .finished)
            return
        }
        
        requested += demand
        
        guard requested > .none else  { return }
        
        requested -= .max(1)
        times -= .max(1)
        requested += subscriber?.receive(0) ?? .none
        if times == .none {
            subscriber?.receive(completion: .finished)
            return
        }
        guard requested > .none else  { return }
        requested -= .max(1)
        times -= .max(1)
        requested += subscriber?.receive(1) ?? .none
        if times == .none {
            subscriber?.receive(completion: .finished)
            return
        }
        
        // fibonacci
        var prev = 0
        var current = 1
        var temp: Int
        while requested > .none {
            temp = prev
            prev = current
            current += temp
            requested += subscriber?.receive(current) ?? .none
            times -= .max(1)
            requested -= .max(1)
            if times == .none {
                subscriber?.receive(completion: .finished)
                return
            }
        }
    }
}

extension Publisher {}

extension Publishers {
    private static func fibonacci(configuration: FibonacciConfiguration) -> FibonacciPublisher {
        FibonacciPublisher(configuration: configuration)
    }
    
    static func fibonacci(times: Subscribers.Demand = .max(10)) -> FibonacciPublisher {
        FibonacciPublisher(configuration: FibonacciConfiguration(times: times))
    }
}
//let subscription = Publishers.fibonacci() .print() .sink { _ in }
//let subscription0 = Publishers.fibonacci(times: .max(0)) .print() .sink { _ in }
//let subscription1 = Publishers.fibonacci(times: .max(1)) .print() .sink { _ in }
//let subscription2 = Publishers.fibonacci(times: .max(2)) .print() .sink { _ in }
//let subscription3 = Publishers.fibonacci(times: .max(3)) .print() .sink { _ in }
//let subscription4 = Publishers.fibonacci(times: .max(4)) .print() .sink { _ in }
let subscriber = FibonacciSubscriber(limit: 4)
Publishers.fibonacci() .print().subscribe(subscriber)

// 1 2 3 4 5 6 7 8  9  10 11 12 13
// 0 1 1 2 3 5 8 13 21 34 55 89 144

let a: Subscribers.Demand = .max(2)
let b = a - .max(1)
let c = a - .max(2)
Subscribers.Demand .none == .max(0)
//let d = a - .max(3)
//let e = a - .max(43)


//    .handleEvents(receiveSubscription: { subscription in
//        print("receiveSubscription: \(subscription)")
//    }, receiveOutput: { output in
//        print("output: \(output)")
//    }, receiveCompletion: { completion in
//        print("receiveCompletion: \(completion)")
//    }, receiveCancel: {
//        print("receiveCancel")
//    }, receiveRequest: { demand in
//        print("receiveRequest: \(demand)")
//    })
