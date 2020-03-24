import UIKit

let queue = DispatchQueue(label: "com.uninova.queue", attributes: .concurrent)
let group = DispatchGroup()
let semaphore = DispatchSemaphore(value: 3)

for i in 1...10 {
    group.enter()
    queue.async() {
        semaphore.wait()
        defer { group.leave(); semaphore.signal() }
        print("image \(i) start")
        Thread.sleep(forTimeInterval: 3)
        print("image \(i) end")
    }
}

group.notify(queue: queue) {
    print("All tasks are finished")
}

print("END FILE")
