import UIKit

var str = "Hello, playground"


class Cat {
    var name: String
    init(name:String) {
        self.name = name;
    }
}

let cat1 = Cat(name: "Kitty")
var cat2 = cat1

cat1.name = "Oscar"

print("cat1 name: \(cat1.name), cat2 name: \(cat2.name)")

struct Dog {
    var name: String
    var age: Int?
    
    init(name: String) {
        self.name = name;
    }
}

var dog1 = Dog(name: "Doggy")
var dog2 = dog1
dog1.name = "Oscarito"

print("dog1 name: \(dog1.name), dog2 name: \(dog2.name)")


class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // do nothing -- an arbitrary vehicle doesn't necessarily make a noise
    }
}

let someVehice = Vehicle()
print("Vehicle: \(someVehice.description)")

class Bicycle: Vehicle {
    var hasBasket = false
}

let bike = Bicycle()
bike.hasBasket = true
bike.currentSpeed = 15.0
print("Bike: \(bike.description)")


class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
    
    func result() -> String {
        return "\(count)"
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 5)
//counter.reset()
print("Counter is now at \(counter.result())")


struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    
    mutating func moveBySecond(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at \(somePoint.x), \(somePoint.y)")

let fixedPoint = Point(x: 3.0, y: 3.0)


enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
print(ovenLight)
ovenLight.next()
print(ovenLight)

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var playerA = Player(name: "Aguero")
playerA.complete(level: 1)
print("highest unlocked level is now: \(LevelTracker.highestUnlockedLevel)")

var playerB = Player(name: "Anderson")
if (playerB.tracker.advance(to: 6)) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
