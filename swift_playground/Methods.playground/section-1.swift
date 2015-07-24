// Playground - noun: a place where people can play

import UIKit


//Instance Methods

class Counter{
    var count=0
    func increment(){
        ++count
    }
    func incrementBy(amount:Int){
        count+=amount
    }
    func reset(){
        count=0
    }
}

let counter=Counter()
counter.increment()

counter.incrementBy(4)
counter.reset()


class  Counter1 {
    var count:Int=0
    
    func incrementBy(amount:Int,numberOfTimes:Int){
        count+=amount*numberOfTimes
    }
    
    func incrementWith(amount:Int, _ numberOfTimes:Int){
        count+=amount*numberOfTimes
    }
    
    func increment()
    {
        self.count++
    }
}

var counter1=Counter1()
counter1.incrementBy(10, numberOfTimes: 3)

//Modifying External Parameter Name Behavior for Methods
counter1.incrementWith(5, 5)


//The self Property

struct Point{
    var x=0.0,y=0.0
    
    func isToTheRightOfX(x:Double)->Bool{
        return self.x > x
    }
    
    mutating func moveByX(deltaX:Double, y deltaY:Double){
        x+=deltaX
        y+=deltaY
        
    }
}
let some_point = Point(x:4.0,y:5.0)
if some_point.isToTheRightOfX(1.0){
    println("this point is to the right of the line where x = 1.0")
}

//Modifying Value Types from Within Instance Methods

var point=Point(x: 1.0, y: 1.0)
point.moveByX(2.0, y: 3.0)
println("The point is now at (\(point.x), \(point.y))")

let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveByX(20.0, y: 30.0)



//Assigning to self Within a Mutating Method

struct Point1 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        self = Point1(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch{
    case Off,Low,High
    
   mutating func next(){
        switch self {
        case Off:
            self=Low
        case Low:
            self=High
        case High:
            self=Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()




//Type Methods

class SomeClass{
    class func someTypeMethod(){
        println("this is type method")
    }
    
}

SomeClass.someTypeMethod()


struct  LevelTracker {
    static var highestUnlockedLevel = 1
    
    static func unlockLevel(level:Int){
        
        if level > highestUnlockedLevel{
            highestUnlockedLevel=level
        }
    }
    
    static func levelIsUnlocked(level:Int)->Bool{
     return level <= highestUnlockedLevel
    }
    
    var currentLevel=1
    
    mutating func advanceToLevel(level:Int)->Bool{
        if LevelTracker.levelIsUnlocked(level){
            currentLevel=level
            return true
        }
        else{
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(1)
println("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// prints "highest unlocked level is now 2"


player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) {
    println("player is now on level 6")
} else {
    println("level 6 has not yet been unlocked")
}
// prints "level 6 has not yet been unlocked"






























