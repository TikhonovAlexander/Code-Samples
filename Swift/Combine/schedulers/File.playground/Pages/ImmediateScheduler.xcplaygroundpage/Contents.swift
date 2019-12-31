import Combine
import SwiftUI
import PlaygroundSupport

let source = Timer
    .publish(every: 1.0, on: .main, in: .common)
    .autoconnect()
    .scan(0) { (counter, _ ) in counter + 1 }
    
let setupPublisher = { recorder in
    source
        .receive(on: DispatchQueue.global())
        .recordThread(using: recorder)
        .receive(on: ImmediateScheduler.shared)
        .recordThread(using: recorder)
        .eraseToAnyPublisher()
}

let view = ThreadRecorderView(title: "Using ImmediateScheduler", setup: setupPublisher)
PlaygroundPage.current.liveView = UIHostingController(rootView: view)
