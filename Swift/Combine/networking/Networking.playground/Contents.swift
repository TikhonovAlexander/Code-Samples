import UIKit
import Combine

let url = URL(string: "https://www.raywenderlich.com")!
let publisher = URLSession.shared
    .dataTaskPublisher(for: url)
    .map(\.data)
    .multicast { PassthroughSubject<Data, URLError>() }

let subsription1 = publisher
.sink(receiveCompletion: { completion in
    if case .failure(let err) = completion {
        print("Sink1 Retrieving data failed with error \(err)")
    }
}, receiveValue: { object in
    print("Sink1 Retrieved object \(object)")
})

let subsription2 = publisher
.sink(receiveCompletion: { completion in
    if case .failure(let err) = completion {
        print("Sink2 Retrieving data failed with error \(err)")
    }
}, receiveValue: { object in
    print("Sink2 Retrieved object \(object)")
})

let subscription = publisher.connect()
