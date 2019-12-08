import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "Publisher") {
    let myNotification = Notification.Name("MyNotification")
    
    let center = NotificationCenter.default
    
    let publisher = center.publisher(for: myNotification, object: nil)
    
    
    let observer = center.addObserver( forName: myNotification, object: nil, queue: nil) { notification in
        print("Notification received!")
    }
    
    center.post(name: myNotification, object: nil)
    center.removeObserver(observer)
}

example(of: "Subscriber") {
    let myNotification = Notification.Name("MyNotification")
    let publisher = NotificationCenter.default .publisher(for: myNotification, object: nil)
    let center = NotificationCenter.default
    
    let subscription = publisher.sink { _ in
        print("Notification received from a publisher!")
    }
    
    center.post(name: myNotification, object: nil)
    subscription.cancel()
    center.post(name: myNotification, object: nil)
}

example(of: "Just") {
    
    let just = Just("Hello world!")
    
    _ = just.sink(
        receiveCompletion: {
            print("Received completion", $0)
    },
        receiveValue: {
            print("Received value", $0)
    })
    
    _ = just .sink(
        receiveCompletion: {
            print("Received completion (another)", $0)
    },
        receiveValue: {
            print("Received value (another)", $0)
    })
}


example(of: "assign(to:on:)") {
    class Object {
        var value: String = "" {
            didSet {
                print(value)
            }
        } }
    let object = Object()
    let publisher = ["Bye", "world!"].publisher
    _ = publisher
        .assign(to: \.value, on: object)
}


example(of: "Custom Subscriber") {
    
    let publisher = (1...6).publisher
    
    final class IntSubscriber: Subscriber {
        typealias Input = Int
        typealias Failure = Never
        
        func receive(subscription: Subscription) {
            subscription.request(.max(3))
        }
        
        func receive(_ input: Int) -> Subscribers.Demand {
            print("Received value", input)
            return .none
        }
        
        func receive(completion: Subscribers.Completion<Never>) {
            print("Received completion", completion)
        }
    }
    
    let subscriber = IntSubscriber()
    publisher.subscribe(subscriber)
}


//example(of: "Future") {
//    func futureIncrement(integer: Int, afterDelay delay: TimeInterval) -> Future<Int, Never> {
//        Future<Int, Never> { promise in
//            print("Start")
//            DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
//                print("Promise Start")
//                promise(.success(integer + 1))
//                print("Promise End")
//            }
//            print("End")
//        }
//    }
//
//    let future = futureIncrement(integer: 1, afterDelay: 2)
//
//    future.sink(receiveCompletion: {
//        print($0)
//    }) {
//        print($0)
//    }.store(in: &subscriptions)
//}

example(of: "PassthroughSubject") {
    enum MyError: Error {
        case test
    }
    
    final class StringSubscriber: Subscriber {
        typealias Input = String
        typealias Failure = MyError
        
        func receive(subscription: Subscription) {
            subscription.request(.max(2))
        }
        func receive(_ input: String) -> Subscribers.Demand { print("Received value", input)
            return input == "World" ? .max(1) : .none
        }
        func receive(completion: Subscribers.Completion<MyError>) {
            print("Received completion", completion)
        }
    }
    let subscriber = StringSubscriber()
    
    let subject = PassthroughSubject<String, MyError>()
    subject.subscribe(subscriber)
    let subsription = subject.sink(receiveCompletion: { completion in
        print("Received completion (sink)", completion)
    }) { value in
        print("Received value (sink)", value)
    }
    subject.send("Hello")
    subject.send("World")
    
    subsription.cancel()
    subject.send("Still there?")
    subject.send(completion: .failure(MyError.test))
    subject.send(completion: .finished)
    subject.send("And now?")
}

example(of: "CurrentValueSubject") {
    let subject = CurrentValueSubject<Int, Never>(0)
    subject
        .print()
        .sink(receiveValue: { print($0) }) .store(in: &subscriptions)
    subject.send(1)
    print(subject.value)
    subject.send(2)
    
    subject
        .print()
        .sink(receiveValue: { print("Second subscription:", $0) }) .store(in: &subscriptions)
    subject.send(completion: .finished)
}

example(of: "Dynamically adjusting Demand") {
    final class IntSubscriber: Subscriber {
        typealias Input = Int
        typealias Failure = Never
        
        func receive(subscription: Subscription) {
            subscription.request(.max(2))
        }
        func receive(_ input: Int) -> Subscribers.Demand {
            print("Received value", input)
            switch input {
            case 1:
                return .max(2)
            case 3:
                return .max(1)
            default:
                return .none
            }
        }
        func receive(completion: Subscribers.Completion<Never>) {
            print("Received completion", completion)
        }
    }
    let subsriber = IntSubscriber()
    let subject = PassthroughSubject<Int, Never>()
    subject.subscribe(subsriber)
    subject.send(1)
    subject.send(2)
    subject.send(3)
    subject.send(4)
    subject.send(5)
    subject.send(6)
}

example(of: "Type erasure") {
    let subject = PassthroughSubject<Int, Never>()
    let publisher = subject.eraseToAnyPublisher()
    publisher
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    subject.send(0)
}

subscriptions.removeAll()

