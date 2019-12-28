import UIKit
import Combine

// Use share() when you simply need to share a publisher with multiple subscribers.
// Use multicast(_:) when you need fine control over when the upstream publisher starts to work and how values propagate to subscribers.
// Use Future to share the single result of a computation to multiple subscribers.

var store = Set<AnyCancellable>()
let url = URL(string: "https://ya.ru")!
let publisher = URLSession.shared
    .dataTaskPublisher(for: url)
    .map(\.data)
    .print("shared")
    .share()
    .eraseToAnyPublisher()

publisher.sink(receiveCompletion: { _ in
}) { data in
    print("publisher sink1 \(data.count)")
}.store(in: &store)
DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
    publisher.sink(receiveCompletion: { _ in
    }) { data in
        print("publisher sink2 \(data.count)")
    }
.store(in: &store)
}

let subject = PassthroughSubject<Data, URLError>()
let publisher2 = URLSession.shared
    .dataTaskPublisher(for: url)
    .map(\.data)
    .print("shared")
    .multicast(subject: subject)

publisher2.sink(receiveCompletion: { _ in
}) { data in
    print("publisher2 sink1 \(data.count)")
}.store(in: &store)
DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
    publisher2.sink(receiveCompletion: { _ in
    }) { data in
        print("publisher2 sink2 \(data.count)")
    }
.store(in: &store)
}

publisher2
    .connect()
    .store(in: &store)

let future = Future<Int, Never> { fullfill in
    print("start future")
    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
        print("start fullfill")
        fullfill(.success(1))
        print("end fullfill")
    }
    print("end future")
}

future.sink { value in
    print("Future value \(value)")
}.store(in: &store)

DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(2)) {
    future.sink { value in
        print("Future after value \(value)")
    }.store(in: &store)
}
