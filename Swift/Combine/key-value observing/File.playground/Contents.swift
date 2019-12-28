import UIKit

struct PureSwift {
    let a: (Int, Bool)
}
class TestObject: NSObject {
    @objc dynamic var integerProperty: Int = 0
    // @objc dynamic var structProperty: PureSwift = .init(a: (0,false))
}
let obj = TestObject()

let subscription = obj.publisher(for: \.integerProperty) .sink {
    print("integerProperty changes to \($0)")
}

obj.integerProperty = 100
obj.integerProperty = 200

class MonitorObject: ObservableObject {
    @Published var someBool = false
    @Published var someOtherProperty = ""
}

let monitorObject = MonitorObject()
monitorObject.objectWillChange.sink { (obj) in
    print("object will change")
}

monitorObject.someBool = true
monitorObject.someOtherProperty = "Hello"
