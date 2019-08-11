//: [Previous](@previous)

import Foundation
import Combine

print("1")
let f = Future { (subscriber: @escaping (Result<String,Error>) -> Void) in
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
        subscriber(.success("25"))
    }
}
.flatMap({ str -> Future<Int, Error> in
    if let a = Int(str) {
        return Future { (subscriber: @escaping (Result<Int,Error>) -> Void) in  subscriber(.success(a))}
    }
    return Future { (subscriber: @escaping (Result<Int,Error>) -> Void) in  subscriber(.success(-1))}
})
.map { $0 * 2 }
.sink(receiveCompletion: { _ in }, receiveValue: { print($0) })
print("2")



//: [Next](@next)
