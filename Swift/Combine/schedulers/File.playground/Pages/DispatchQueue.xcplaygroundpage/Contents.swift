import Combine
import SwiftUI
import PlaygroundSupport

let serialQueue = DispatchQueue(label: "Serial queue")
let sourceQueue = DispatchQueue.main

let source = PassthroughSubject<Void, Never>()

let subscription = sourceQueue.schedule(after: sourceQueue.now, interval: .seconds(1)) {
    source.send()
}

sourceQueue.schedule(after: sourceQueue.now.advanced(by: .seconds(4))) {
    subscription.cancel()
}

let setupPublisher = { recorder in
    source
        .recordThread(using: recorder)
        .receive(on: serialQueue)
        .recordThread(using: recorder)
        .eraseToAnyPublisher()
}


let view = ThreadRecorderView(title: "Using DispatchQueue", setup: setupPublisher)
PlaygroundPage.current.liveView = UIHostingController(rootView: view)
