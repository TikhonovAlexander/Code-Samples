//: [Previous](@previous)

import Foundation
import Combine

let publisher = [1,2,3,3,1].publisher
publisher.map {
    $0 * 2
}
.filter {
    $0 < 8
}
.removeDuplicates() // removing duplicates of next values
.flatMap {
    Just($0)
}
.sink { (value) in
    print(value)
}

let v1 = PassthroughSubject<String, Never>()
let v2 = PassthroughSubject<String, Never>()
let merge = v1.merge(with: v2)
.sink { (value) in
    print(value)
}

let combineLatest = v1.combineLatest(v2)
.sink { (value) in
    print(value)
}

v1.send("Value 1")
v2.send("Value 2")
v2.send("Value 3")
v1.send("Value 4")


[1,2,3].publisher
.scan(0) { (total, value) in
    total + value
}
.sink { (value) in
    print(value)
}

//: [Next](@next)
