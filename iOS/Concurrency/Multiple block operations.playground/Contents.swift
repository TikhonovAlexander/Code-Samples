import UIKit

var sequence = "Hello Swift and Kotlin"

let blockOperation = BlockOperation()

for s in sequence.split(separator: " ") {
    blockOperation.addExecutionBlock {
        print(s)
        sleep(2)
    }
}
blockOperation.completionBlock = {
    print("all tasks are finished")
}
blockOperation.start()
