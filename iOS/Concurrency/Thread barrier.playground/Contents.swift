import UIKit

var str = "Hello, playground"

private let threadSafeQueue = DispatchQueue(label: "label", attributes: .concurrent)
private var _count: Int = 0
public var count: Int {
    get {
        _count
    }
    set {
        threadSafeQueue.async(flags: .barrier) {
            _count = newValue
        }
    }
}

//  The barrier task won’t occur until all of the previous reads have completed.
// Once the barrier hits, the queue pretends that it’s serial and only the barrier task can run until completion. Once it completes, all tasks that were submitted after the barrier task can again run concurrently.
