import Combine
import SwiftUI
import PlaygroundSupport

let throttleDelay = 1.0
let subject = PassthroughSubject<String, Never>()

let throttled = subject
    .throttle(for: .seconds(throttleDelay), scheduler: DispatchQueue.main, latest: true)
    .share()

let subjectTimeline = TimelineView(title: "Emitted values")
let throttledTimeline = TimelineView(title: "Throttled values")
let view = VStack(spacing: 100) {
    subjectTimeline
    throttledTimeline
}
PlaygroundPage.current.liveView = UIHostingController(rootView: view)
subject.displayEvents(in: subjectTimeline)
throttled.displayEvents(in: throttledTimeline)

let subscription1 = subject .sink { string in
    print("+\(deltaTime)s: Subject emitted: \(string)")
}
let subscription2 = throttled .sink { string in
    print("+\(deltaTime)s: Throttled emitted: \(string)")
}

subject.feed(with: typingHelloWorld)
