//: [Previous](@previous)

import Combine

var str = "Hello, playground"

let ps = PassthroughSubject<String, Never>()
ps.send("Passthrough")
ps.sink { (value) in
    print(value)
}
ps.send("Subject")

let a = CurrentValueSubject<String, Never>("Init value")
a.send("Current")
a.sink { (value) in
    print(value)
}
a.send(subscription: Subscriptions.empty)
a.send("Value")

let arr = [4, 6, 9]
print("map:")
arr.publisher.map {
    $0 * $0
}.sink { (value) in
    print(value)
}
print("scan:")
arr.publisher.scan(0) { (total, value) -> Int in
    total + value
}.sink { (value) in
    print(value)
}
print("filter:")
arr.publisher.filter { $0 > 5 }
.sink { (value) in
    print(value)
}
print("flatMap:")
arr.publisher.flatMap { value -> Publishers.Sequence<[Double], Never> in
    if value != 4 {
        return Publishers.Sequence<[Double], Never>(sequence: [Double(value) / 2.0])
    } else {
        return Publishers.Sequence<[Double], Never>(sequence: [0])
    }
}.sink { (value) in
    print(value)
}

print("flatMap2:")
arr.publisher.flatMap { value -> Just<String> in
    if value != 4 {
        return Just(String(value))
    } else {
        return Just("Four")
    }
}.sink { (value) in
    print(value)
}

print("replaceEmpty:")
[Int]().publisher.replaceEmpty(with: 666)
.sink { (value) in
    print(value)
}

print("min:")
arr.publisher.min()
.sink { (value) in
    print(value)
}

ps.send("Event 0")
let sub1 = ps.eraseToAnyPublisher()
sub1.sink { (value) in
    print("sub1: \(value)")
}
ps.send("Event 1")
let sub2 = ps.eraseToAnyPublisher()
sub2.sink { (value) in
    print("sub2: \(value)")
}
ps.send("Event 2")


let j = Just("Privet")
let sub3 = j.eraseToAnyPublisher()
sub3.sink { (value) in
    print("sub3: \(value)")
}
let sub4 = j.eraseToAnyPublisher()
sub4.sink { (value) in
    print("sub4: \(value)")
}

//: [Next](@next)
