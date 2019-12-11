import Combine
import SwiftUI
import PlaygroundSupport

let subject = PassthroughSubject<String, Never>()

let debounced = subject
    .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
    .share()

let subjectTimeline = TimelineView(title: "Emitted values")
let debouncedTimeline = TimelineView(title: "Debounced values")

let view = VStack(spacing: 100) {
    subjectTimeline
    debouncedTimeline
}
PlaygroundPage.current.liveView = UIHostingController(rootView: view)

subject.displayEvents(in: subjectTimeline)
debounced.displayEvents(in: debouncedTimeline)

let subsription2 = debounced
    .sink { string in
        print("+\(deltaTime)s: Debounced emitted: \(string)")
}

subject.feed(with: typingHelloWorld)
