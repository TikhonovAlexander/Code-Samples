//: [Previous](@previous)

import UIKit
import Combine

class UIControlSubscription<SubscriberType: Subscriber, Control: UIControl>: Subscription where SubscriberType.Input == Control {
    
    private var subscriber: SubscriberType?
    private let control: Control
    
    init(subscriber: SubscriberType, control: Control, event: UIControl.Event) {
        self.subscriber = subscriber
        self.control = control
        control.addTarget(self, action: #selector(eventHandler), for: event)
    }
    
    func request(_ demand: Subscribers.Demand) {
        // We do nothing here as we only want to send events when they occur.
    }
    
    func cancel() {
        subscriber = nil
    }
    
    @objc private func eventHandler() {
        subscriber?.receive(control)
    }
}

struct UIControlPublisher<Control: UIControl>: Publisher {
    
    typealias Output = Control
    typealias Failure = Never
    
    let control: Control
    let controlEvent: UIControl.Event

    init(control: Control, event: UIControl.Event) {
        self.control = control
        self.controlEvent = event
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, UIControlPublisher.Failure == S.Failure, UIControlPublisher.Output == S.Input {
        let subscription = UIControlSubscription(subscriber: subscriber, control: control, event: controlEvent)
        subscriber.receive(subscription: subscription)
    }
    
}


protocol CombineCompatible { }
extension UIControl: CombineCompatible {}
extension CombineCompatible where Self: UIControl {
    func publisher(event: UIControl.Event) -> UIControlPublisher<Self> {
        return UIControlPublisher<Self>.init(control: self, event: event)
    }
}


let button = UIButton(type: .system)

button.publisher(event: .touchUpInside)
.sink { (button) in
    print("Button is pressed")
}
button.sendActions(for: .touchUpInside)
//: [Next](@next)
