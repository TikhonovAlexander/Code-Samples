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

//(0.0, "H"),
//(0.1, "He"),
//(0.2, "Hel"),
//(0.3, "Hell"),
//(0.5, "Hello"),
//(0.6, "Hello "),
//(2.0, "Hello W"),
//(2.1, "Hello Wo"),
//(2.2, "Hello Wor"),
//(2.4, "Hello Worl"),
//(2.5, "Hello World")
