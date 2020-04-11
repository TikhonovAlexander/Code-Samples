import UIKit

class AsyncOperation: Operation {
    
    enum State: String {
        case ready, executing, finished
        fileprivate var keyPath: String {
            return "is\(rawValue.capitalized)"
        }
    }
    
    var state: State = .ready {
        didSet {
            didChangeValue(forKey: oldValue.rawValue)
            didChangeValue(forKey: state.keyPath)
        }
        willSet {
            willChangeValue(forKey: newValue.keyPath)
            willChangeValue(forKey: state.keyPath)
        }
    }
    
    // Overrides
    
    override var isReady: Bool {
        super.isReady && state == .ready
    }
    
    override var isExecuting: Bool {
        state == .executing
    }
    
    override var isFinished: Bool {
        state == .finished
    }
    
    override var isAsynchronous: Bool {
        true
    }
    
    override func start() {
        main()
        state = .executing
    }
}

class SumAsyncOperation: AsyncOperation {
    var lhs: Int
    var rhs: Int
    var result: Int?
    
    init(lhs: Int, rhs: Int) {
        self.lhs = lhs
        self.rhs = rhs
        super.init()
    }
    
    override func main() {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 2)
            self.result = self.lhs + self.rhs
            self.state = .finished
        }
    }
}

let queue = OperationQueue()
let pairs = [ (1, 0), (1, 1), (1, 2), (1, 3), (1, 4), (1, 5) ]
pairs.forEach { pair in
    
    let asyncOperation = SumAsyncOperation(lhs: pair.0, rhs: pair.1)
    asyncOperation.completionBlock = {
        guard let result = asyncOperation.result else { return }
        print("\(pair.0) + \(pair.1) = \(result)")
    }
    queue.addOperation(asyncOperation)
}

// 1 + 3 = 4
// 1 + 2 = 3
// 1 + 0 = 1
// 1 + 1 = 2
// 1 + 5 = 6
// 1 + 4 = 5
