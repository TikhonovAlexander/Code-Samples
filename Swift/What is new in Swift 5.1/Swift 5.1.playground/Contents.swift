import UIKit

// Massive improvements to synthesized memberwise initializers

struct User: CustomDebugStringConvertible {
    var name: String = "User"
    var age: Int = 0
    
    var debugDescription: String {
        return "\(name) \(age)"
    }
}

let user1 = User()
let user2 = User(name: "Alex")
let user3 = User(age: 2)
let user4 = User(name: "Vasa", age: 33)

// Implicit returns from single-expression functions

func square(_ number: Double) -> Double {
    number.isZero ? number + 1 : number * number
}

square(0)
square(3)

// Universal Self

class Manager {
    class var performance: Double {
        return 0
    }
    
    func talk() {
        print("I'm very productive, my performance is \(Self.performance)")
    }
}

class ScrumManager: Manager {
    override class var performance: Double {
        return -10
    }
}

ScrumManager.performance
let scrumManager = ScrumManager()
scrumManager.talk()

// Opaque return types

protocol Unit: Equatable { }
struct Ork: Unit {}
struct Elf: Unit {}

func buildUnit() -> some Unit {
    return Ork()
}

let u1 = buildUnit() // reverse ork
let u2 = buildUnit() // reverse ork
u1 == u2

func makeInt() -> some Equatable {
    Int.random(in: 1...4)
}

func makeInt2() -> some Equatable {
    Int.random(in: 1...4)
}

func makeDouble() -> some Equatable {
    Double.random(in: 1...4)
}

let i1 = makeInt()
let i2 = makeInt()
let i3 = makeInt2()
let d1 = makeDouble()

i1 == i2
// i1 == i3 error
// i1 == d1 error
