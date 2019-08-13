//: [Previous](@previous)

import UIKit
import Combine

enum ExampleError: Error {
    case somethingWentWrong
}

let ps = PassthroughSubject<String, Never>() //  CurrentValueSubject<String, Never>("Init")
let subscription = ps.handleEvents(receiveSubscription: { (subscription) in
    print("receiveSubscription: \(subscription)")
}, receiveOutput: { (output) in
    print("receiveOutput: \(output)")
}, receiveCompletion: { (completion) in
    print("receiveCompletion: \(completion)")
}, receiveCancel: {
    print("receiveCancel")
}) { (demand) in
    print("demand: \(demand)")
}.sink { _ in }

ps.send("Test 1")
ps.send("Test 2")
subscription.cancel()
ps.send("Test 3")

print("==========")
let printSubscription = ps.print().sink { _ in }
ps.send("Test 4")
printSubscription.cancel()


print("==========")
enum RequestError: Error {
    case sessionError(error: Error)
}
let placeholder = UIImage()
let imageURLPublisher = PassthroughSubject<URL, RequestError>()
let cancellable = imageURLPublisher.flatMap { requestURL  in
    return URLSession.shared.dataTaskPublisher(for: requestURL)
        .map{ (result) -> UIImage? in
            return UIImage(data: result.data)
    }
    .catch{ (requestError) in
        Future { promise in
            promise(.success(placeholder))
        }
    }
}

.sink(receiveCompletion: { (completion) in
    print(completion)
}) { result in
    print(result ?? "No image")
}

imageURLPublisher.send(URL(string: "https://unknown.url/image")!)
imageURLPublisher.send(URL(string: "https://httpbin.org/image/jpeg")!)


let aw = [1, 2].publisher.share()

//: [Next](@next)
