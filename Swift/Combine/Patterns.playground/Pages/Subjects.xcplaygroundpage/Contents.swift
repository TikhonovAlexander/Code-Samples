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

//: [Next](@next)
