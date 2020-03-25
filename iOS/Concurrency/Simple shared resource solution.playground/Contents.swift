import UIKit

private var counterQueue = DispatchQueue(label: "Counter")
private var _counter: Int = 0
public var counter: Int {
    get {
        counterQueue.sync {
            _counter
        }
    }
    set {
        counterQueue.sync {
            _counter = newValue
        }
    }
}

