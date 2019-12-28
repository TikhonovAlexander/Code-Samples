import UIKit
import Combine

var str = "Hello, playground"

//let subscription =
//    RunLoop.current.schedule(after: RunLoop.current.now, interval: .seconds(1),  tolerance: .milliseconds(100)) {
//    print("Timer fired")
//}

var store = Set<AnyCancellable>()
//let globalQueue = DispatchQueue.global(qos: .background)
//globalQueue.asyncAfter(deadline: .now() + 2) {
//
//    Timer.publish(every: 1.0, on: .current, in: .common)
//        .autoconnect()
//        .scan(0) { counter, _ in counter + 1 }
//        .sink { counter in
//            print(counter)
//    }
//    .store(in: &store)
//    // https://stackoverflow.com/questions/38000727/need-some-clarifications-about-dispatch-queue-thread-and-nsrunloop
//    RunLoop.current.run()
//}

let main = DispatchQueue.main
let source = PassthroughSubject<Int, Never>()
var counter = 0
main.schedule(after: main.now, interval: .seconds(1)) {
    source.send(counter)
    counter += 1
}.store(in: &store)

let subscription = source.sink {
    print($0)
}

print("End")
