



import Combine
import Foundation

print("===== JUST MAP")
let just = Just("3")
    .map { value -> Int? in
        return Int(value)
}
.sink(receiveCompletion: { (completion) in
    print(completion)
}) { recievedValue in
    print("recievedValue", recievedValue ?? "nil")
}

print("===== JUST FLATMAP")
let just2 = Just("532s")
    .flatMap { value -> Just<Int> in // Transforms all elements from an upstream publisher into a new or existing publisher.
        if let v = Int(value) {
            return Just(Int(v))
        }
        return Just(-1)
}.sink(receiveCompletion: { (completion) in
    print(completion)
}) { recievedValue in
    print("recievedValue", recievedValue)
}


print("===== JUST COMPACTMAP")

let just3 = Just("7")
    .compactMap { value -> Int? in
        return Int(value)
}.sink(receiveCompletion: { (completion) in
    print(completion)
}) { recievedValue in
    print("recievedValue", recievedValue)
}

print("===== PassthroughSubject MAP")
let p = PassthroughSubject<String, Error>()
p.sink(receiveCompletion: { (completion) in
    print(completion)
}) { recievedValue in
    print("recievedValue", recievedValue)
}
p.send("9")
print("=====")
