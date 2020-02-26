import UIKit

// This implementation uses AnyObject type for observers, not Any like in iOS native NotificationCenter
typealias MyNotificationName = String

class MyNotificationCenter {
    private class Pair {
        let object: AnyObject
        let block: () -> Void
        init(object: AnyObject, block: @escaping () -> Void) {
            self.object = object
            self.block = block
        }
    }
    private static let defaultImp = MyNotificationCenter()    
    static var `default`: MyNotificationCenter {
        defaultImp
    }
    private var table: [MyNotificationName: [Pair]] = [:]
    
    func addObserver(_ observer: AnyObject, name aName: MyNotificationName, block: @escaping () -> Void) {
        var observers = table[aName, default: []]
        let pair = Pair(object: observer, block: block)
        observers.append(pair)
        table[aName] = observers
    }
    
    func removeObserver(_ observer: AnyObject) {
        table.forEach { (name, _) in
            self.removeObserver(observer, name: name)
        }
    }
    
    func removeObserver(_ observer: AnyObject, name aName: MyNotificationName) {
        guard let observedPairs = table[aName] else { return }
        let filteredPairs = observedPairs.filter { pair in
            pair.object !== observer
        }
        table[aName] = filteredPairs.isEmpty ? nil : filteredPairs
    }
    
    func post(name aName: MyNotificationName) {
        guard let observedPairs = table[aName] else { return }
        print("Post \(aName) was sent")
        observedPairs.forEach { pair in
            pair.block()
        }
    }
}


let number: AnyObject = NSNumber(value: 1)
let string: AnyObject = NSString(string: "str 1")
let number2: AnyObject = NSNumber(value: 2)
let string2: AnyObject = NSString(string: "str 2")
let center = MyNotificationCenter.default
center.addObserver(number, name: "Number") {
    print("Number 1")
}
center.addObserver(number2, name: "Number") {
    print("Number 2")
}
center.addObserver(string, name: "String") {
    print("String 1")
}
center.addObserver(string, name: "Number") {
    print("String 2")
}
center.post(name: "Number")
center.removeObserver(number, name: "Number")
center.post(name: "Number")
center.addObserver(number, name: "Number") {
    print("Number 1 new")
}
center.post(name: "Number")
center.post(name: "String")
