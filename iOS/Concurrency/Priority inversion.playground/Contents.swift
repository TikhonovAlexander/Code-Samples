import UIKit

let high = DispatchQueue.global(qos: .userInteractive)
let medium = DispatchQueue.global(qos: .userInitiated)
let low = DispatchQueue.global(qos: .background)

let semaphore = DispatchSemaphore(value: 1)
high.async {
    Thread.sleep(forTimeInterval: 2)
    semaphore.wait()
    defer { semaphore.signal() }
    print("High priority task is now running")
}

for i in 1...10 {
    medium.async {
        let waitTime = Double.random(in: 1...7)
        print("Running medium task \(i)")
        Thread.sleep(forTimeInterval: waitTime)
    }
}

low.async {
    semaphore.wait()
    defer { semaphore.signal() }
    print("Running long, lowest priority task")
    Thread.sleep(forTimeInterval: 5)
}
