import Foundation
import Combine

private final class ShareReplaySubscription<Output, Failure: Error>: Subscription {
    
    let capacity: Int
    var subscriber: AnySubscriber<Output, Failure>? = nil
    var demand: Subscribers.Demand = .none
    var buffer: [Output]
    var completion: Subscribers.Completion<Failure>? = nil
    
    init<S>(subscriber: S, replay: [Output], capacity: Int, completion: Subscribers.Completion<Failure>?) where S: Subscriber, Failure == S.Failure, Output == S.Input {
        self.subscriber = AnySubscriber(subscriber)
        self.buffer = replay
        self.capacity = capacity
        self.completion = completion
    }
    
    func request(_ demand: Subscribers.Demand) {
        
    }
    
    func cancel() {
        
    }
    
    
}
