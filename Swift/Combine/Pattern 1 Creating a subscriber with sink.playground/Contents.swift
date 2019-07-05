import Combine
import Foundation



let just = Just("3")
    .map { value -> Int? in
        return Int(value)
}.sink(receiveCompletion: { (completion) in
    print(completion)
}) { recievedValue in
    print(recievedValue ?? "nil")
}
print("=====")
let just2 = Just("5")
    .flatMap { value -> Just<Int> in // Transforms all elements from an upstream publisher into a new or existing publisher.
        return Just(Int(value)!)
}.sink(receiveCompletion: { (completion) in
    print(completion)
}) { recievedValue in
    print(recievedValue)
}
print("=====")

let just3 = Just("7")
    .compactMap { value -> Int? in
        return Int(value)
}.sink(receiveCompletion: { (completion) in
    print(completion)
}) { recievedValue in
    print(recievedValue)
}
print("=====")
