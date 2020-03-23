import UIKit

let work1 = DispatchWorkItem {
    print("work_1 start")
    sleep(2)
    print("work_1 finish")
}
let work2 = DispatchWorkItem {
    print("work_2 start")
    sleep(1)
    print("work_2 finish")
}

print("////-------------Serial-------------")
let serialQueue = DispatchQueue(label: "com.tikhonov.serialQueue")
print("Start sync serial")
serialQueue.sync(execute: work1)
serialQueue.sync(execute: work2)
print("Finish sync serial")
print("Start async serial")
serialQueue.async(execute: work1)
serialQueue.async(execute: work2)
print("Finish async serial")

sleep(4)
print("////-------------Concurrent-------------")

let concurrentQueue = DispatchQueue(label: "com.tikhonov.concurrentQueue", qos: .utility, attributes: .concurrent)
print("Start sync concurrent")
concurrentQueue.sync(execute: work1)
concurrentQueue.sync(execute: work2)
print("Finish sync concurrent")
print("Start async concurrent")
concurrentQueue.async(execute: work1)
concurrentQueue.async(execute: work2)
print("Finish async concurrent")

sleep(4)
print("////--------------Cancel------------")

var work3: DispatchWorkItem!
work3 = DispatchWorkItem { //[strong work3] in
    guard let work = work3 else { print("work3 is nil"); return }
    print("work_3 start")
    while true {
        sleep(1)
        print("work_3 working...")
        if work.isCancelled {
            break
        }
    }
    print("work_3 finish")
}

concurrentQueue.async(execute: work3)
concurrentQueue.asyncAfter(deadline: .now() + 2.4) {
    work3.cancel()
}


sleep(4)
print("////--------------Notify------------")
let backgroundWorkItem = DispatchWorkItem {
    print("background start")
    sleep(2)
    print("background end")
}
let label: UILabel = UILabel()
let uiWorkItem = DispatchWorkItem {
    print("ui start")
    label.text = "FINISHED"
    print("ui end")
}
let queue = DispatchQueue(label: "Notify", attributes: .concurrent)
backgroundWorkItem.notify(queue: .main, execute: uiWorkItem)
queue.async(execute: backgroundWorkItem)
