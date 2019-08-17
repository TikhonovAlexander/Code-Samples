//: [Previous](@previous)

import Foundation
import Combine

let p1 = [1,2,3,4].publisher
let p2 = [100, 200].publisher

Publishers.Concatenate(prefix: p1, suffix: p2)
    .sink { (value) in
        print(value)
}
//: [Next](@next)
