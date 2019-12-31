import Combine
import SwiftUI
import PlaygroundSupport

let source = Timer
    .publish(every: 1.0, on: .main, in: .common)
    .autoconnect()
    .scan(0) { (counter, _) in counter + 1 }

var threadRecorder: ThreadRecorder? = nil

let setupPublisher = { recorder in
    source
        .handleEvents(receiveSubscription: { _ in threadRecorder = recorder })
        .subscribe(on: DispatchQueue.global())
        .recordThread(using: recorder)
        .receive(on: RunLoop.current)
        .recordThread(using: recorder)
        .eraseToAnyPublisher()
}
let view = ThreadRecorderView(title: "Using RunLoop", setup: setupPublisher)
PlaygroundPage.current.liveView = UIHostingController(rootView: view)

RunLoop.current.schedule(after: .init(Date(timeIntervalSinceNow: 4.5)), tolerance: .milliseconds(500)) {
  threadRecorder?.subscription?.cancel()
}
