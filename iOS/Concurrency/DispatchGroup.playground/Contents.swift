import UIKit

let work1 = DispatchWorkItem {
    print("work1 start")
    sleep(1)
    print("work1 end")
}
let work2 = DispatchWorkItem {
    print("work2 start")
    sleep(2)
    print("work2 end")
}
let work3 = DispatchWorkItem {
    print("work3 start")
    sleep(3)
    print("work3 end")
}

let queue = DispatchQueue(label: "group queue", attributes: .concurrent)

let group1 = DispatchGroup()

print("/////////////Group notify (async)////////////")
queue.async(group: group1, execute: work2)
queue.async(group: group1, execute: work3)
DispatchQueue.global().async(group: group1, execute: work1)
print("notify start")
group1.notify(queue: queue) {
    print("finished all work items")
}
print("notify end")
sleep(4)

print("/////////////Group wait (sync)////////////")

//let group1 = DispatchGroup()
queue.async(group: group1, execute: work2)
queue.async(group: group1, execute: work3)
DispatchQueue.global().async(group: group1, execute: work1)
queue.async {
    print("wait start")
    if group1.wait(timeout: .now() + 5) == .timedOut {
        print("timeout")
    }
    print("wait end")
}
sleep(4)
