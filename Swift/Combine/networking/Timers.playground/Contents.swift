import UIKit
import Combine

var str = "Hello, playground"

//let subscription =
//    RunLoop.current.schedule(after: RunLoop.current.now, interval: .seconds(1),  tolerance: .milliseconds(100)) {
//    print("Timer fired")
//}

var store = Set<AnyCancellable>()

let queue = DispatchQueue.global(qos: .background)
queue.async {
    let runLoop = RunLoop.current
    runLoop.run()
}

//
//DispatchQueue.global().async {
queue.asyncAfter(deadline: .now() + 2) {

    let runLoop = RunLoop.current
    runLoop.run()
    
    Timer.publish(every: 1.0, on: .current, in: .common)
        .autoconnect()
        .scan(0) { counter, _ in counter + 1 }
        .sink { counter in
            print(counter)
    }
    .store(in: &store)
}
print("End")
