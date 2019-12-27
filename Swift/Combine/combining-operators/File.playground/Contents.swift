import UIKit
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "prepend(Output...)") {
    
    let publisher = [3, 4].publisher
    
    publisher
        .prepend(1, 2)
        .prepend(0)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "prepend(Sequence)") {
    
    let publisher = [5, 6, 7].publisher
    
    publisher
        .prepend([3, 4])
        .prepend(Set(1...2))
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "prepend(Publisher)") {
    
    let publisher = [5, 6, 7].publisher
    let publisher2 = [3, 4].publisher
    
    let ps = PassthroughSubject<Int, Never>()
    
    publisher
        .prepend(publisher2)
        .prepend(ps)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    
    ps.send(0)
    ps.send(1)
    ps.send(completion: .finished)
}

example(of: "append(Output...)") {
    
    let publisher = [3, 4].publisher
    
    publisher
        .append(1, 2)
        .append(0)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "append(Sequence)") {
    
    let publisher = [5, 6, 7].publisher
    
    publisher
        .append([3, 4])
        .append(Set(1...2))
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
}

example(of: "append(Publisher)") {
    
    let publisher = [5, 6, 7].publisher
    let publisher2 = [3, 4].publisher
    
    let ps = PassthroughSubject<Int, Never>()
    
    publisher
        .append(publisher2)
        .append(ps)
        .prepend(stride(from: 100, to: 107, by: 2))
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    
    ps.send(0)
    ps.send(1)
    ps.send(completion: .finished)
}

example(of: "switchToLatest") {
    
    let publisher1 = PassthroughSubject<Int, Never>()
    let publisher2 = PassthroughSubject<Int, Never>()
    let publisher3 = PassthroughSubject<Int, Never>()
    
    let publishers = PassthroughSubject<PassthroughSubject<Int, Never>, Never>()
    publishers
        .switchToLatest()
        .sink(receiveCompletion: { _ in print("Completed!") }, receiveValue: { print($0) })
        .store(in: &subscriptions)
    
    publishers.send(publisher1)
    publisher1.send(1)
    publisher1.send(2)
    
    publishers.send(publisher2)
    publisher1.send(3)
    publisher2.send(4)
    publisher2.send(5)
    
    publishers.send(publisher3)
    publisher2.send(6)
    publisher3.send(7)
    publisher3.send(8)
    publisher3.send(9)
    
    publisher3.send(completion: .finished)
    publishers.send(completion: .finished)
}

//example(of: "switchToLatest - Network Request") {
//    let url = URL(string: "https://source.unsplash.com/random")!
//
//    func getImage() -> AnyPublisher<UIImage?, Never> {
//        return URLSession.shared
//            .dataTaskPublisher(for: url)
//            .map { data, _ in UIImage(data: data) }
//            .print("image")
//            .replaceError(with: nil)
//            .eraseToAnyPublisher()
//    }
//
//    let taps = PassthroughSubject<Void, Never>()
//
//    taps
//        .map { _ in getImage() }
//        .switchToLatest()
//        .sink(receiveValue: { _ in })
//        .store(in: &subscriptions)
//
//    taps.send()
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//        taps.send()
//    }
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
//        taps.send()
//    }
//}

example(of: "merge(with:)") {
    let p1 = PassthroughSubject<Int, Never>()
    let p2 = PassthroughSubject<Int, Never>()
    
    p1
        .merge(with: p2)
        .sink(receiveValue: { print($0) })
        .store(in: &subscriptions)
    
    p1.send(1)
    p1.send(2)
    p2.send(100)
    p1.send(3)
    p2.send(101)
    p2.send(102)
    
    p1.send(completion: .finished)
    p2.send(completion: .finished)
}

example(of: "combineLatest") {
    let p1 = PassthroughSubject<Int, Never>()
    let p2 = PassthroughSubject<String, Never>()
    
    p1
        .combineLatest(p2)
        .sink(receiveCompletion: { _ in print("Completed") }, receiveValue: { print("P1: \($0), P2: \($1)") })
        .store(in: &subscriptions)
    
    p1.send(1)
    p1.send(2)
    p2.send("a")
    p1.send(3)
    p2.send("b")
    p2.send("c")
    p1.send(4)
    
    p1.send(completion: .finished)
    p2.send(completion: .finished)
}

example(of: "zip") {
    let p1 = PassthroughSubject<Int, Never>()
    let p2 = PassthroughSubject<String, Never>()
    
    p1
        .zip(p2)
        .sink(receiveCompletion: { _ in print("Completed") }, receiveValue: { print("P1: \($0), P2: \($1)") })
        .store(in: &subscriptions)
    
    p1.send(1)
    p1.send(2)
    p2.send("a")
    p1.send(3)
    p2.send("b")
    p2.send("c")
    p1.send(4)
    
    p1.send(completion: .finished)
    p2.send(completion: .finished)
}
