



import Combine
import Foundation

print("===== JUST MAP")
let just = Just("3")
    .map { value -> Int? in
        return Int(value)
}.sink(receiveCompletion: { (completion) in
    print(completion)
}) { recievedValue in
    print(recievedValue ?? "nil")
}
print("===== JUST FLAMAP")
let just2 = Just("5")
    .flatMap { value -> Just<Int> in // Transforms all elements from an upstream publisher into a new or existing publisher.
        return Just(Int(value)!)
}.sink(receiveCompletion: { (completion) in
    print(completion)
}) { recievedValue in
    print(recievedValue)
}
print("===== JUST COMPACTMAP")

let just3 = Just("7")
    .compactMap { value -> Int? in
        return Int(value)
}.sink(receiveCompletion: { (completion) in
    print(completion)
}) { recievedValue in
    print(recievedValue)
}

print("===== PassthroughSubject MAP")
let p = PassthroughSubject<String, Error>()
p.send("9")

print("=====")
