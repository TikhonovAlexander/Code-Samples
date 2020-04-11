//
//  AsyncOperation.swift
//  AsyncImages
//
//  Created by tikhonov on 11.04.20.
//  Copyright © 2020 tikhonov. All rights reserved.
//

import Foundation

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
    
    /// you need to call .finished in child class
    override func start() {
        main()
        state = .executing
    }
}
