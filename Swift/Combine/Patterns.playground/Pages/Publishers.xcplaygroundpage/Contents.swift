//: [Previous](@previous)

import Foundation
import Combine

print("# 1")
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
print("# 2")

let p2 = Just(42)
let p3 = Publishers.Sequence<[Int], Error>(sequence: [1,2,3,4])

let p4 = Just(3)
    .merge(with: p2)
.append(1, 2)
.count()
.sink(receiveCompletion: { _ in }, receiveValue: { print("count \($0)") })


class Article {
    var title: String
    init(title: String) { self.title = title }
}
var article = Article(title: "Swift blog")
print(article.title)
var keypath: ReferenceWritableKeyPath<Article, String> = \.title
let s = Subscribers.Assign(object: article, keyPath: keypath)
let source = Future<String, Never> { (subscriber: @escaping (Result<String, Never>) -> Void) in
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
        subscriber(.success("Great Combine!"))
    }
}
source.subscribe(s)

DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
    print(article.title)
}

//: [Next](@next)
