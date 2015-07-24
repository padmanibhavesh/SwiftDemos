// Playground - noun: a place where people can play

import UIKit
//syntax
/*init(){
    
}*/

struct Fahrenheit {
    var temprature: Double
    
    init(){
        temprature = 50.0
    }
}

var f = Fahrenheit()
print("The default temprature is \(f.temprature) ")

struct Celsius {
    
    var tempratureInCelsius: Double
    
    init(fromFahrenheit fahrenheit:Double){
       tempratureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin:Double){
        tempratureInCelsius = kelvin - 273.15
    }
}

var boilingPointOfWater = Celsius(fromFahrenheit: 212.0)

let freezingPointOfWater = Celsius(fromKelvin: 273.15)

boilingPointOfWater.tempratureInCelsius += 50
println(boilingPointOfWater.tempratureInCelsius)

println(freezingPointOfWater.tempratureInCelsius)


struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double){
        red = white
        green = white
        blue = white
    }
    init( _ white: Double){
        red = white
        green = white
        blue = white
    }
    init(white1: Double){
        red = white1
        green = white1
        blue = white1
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
let gray = Color(1.0)
let white = Color(white1: 10)


//Optional Property Types

class SurveyQuestion{
    var text: String
    
    var response: String?
    
    init(text:String){
        self.text = text
    }
    func ask(){
        println(text)
    }
}
let q1 = SurveyQuestion(text: "hiii")
q1.ask()
q1.response = "hi ,  how are you"
println(q1.text)
println(q1.response!)



//Assigning Constant Properties During Initialization

class SurveyQuestion1{
    let text: String
    var response: String?
    
    init(text:String){
        self.text = text
    }
    func ask(){
        println(text)
    }
}


let q2 = SurveyQuestion1(text: "hi, how are you ?")
q2.ask()
q2.response = "hi , i am fine"


//Default Initializers


class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

//Memberwise Initializers for Structure Types

struct Size {
    var width = 0.0, height = 0.0

}
let twoByTwo = Size(width: 2.0, height: 2.0)


//Initializer Delegation for Value Types


struct Size1 {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size1()
    init() {}
    init(origin: Point, size: Size1) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size1) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let basicRect = Rect()


//Class Inheritance and Initialization

//Syntax for Designated and Convenience Initializers

//Designated

/* 
    init(parameters) {
        statements
    }
*/


//Convenience

/*
    convenience init(parameter){
        statement
    }
*/

class Farsan{
    init(){
        println("farsan init()")
    }
    
    init(f: String){
        println(f)
    }
    convenience init(f1:Int){
        self.init()
    }
    
}
class Chavanu: Farsan {
    override init() {
        super.init()
        println("chavanu init()")
    }
    init(c:Int){
        println(c)
        super.init(f: "farsan init(f:String)")
    }
    convenience init(f1:Int){
        self.init()
    }
}
class Sev: Chavanu{
    override init() {
        super.init()
        println("Sev init()")
    }
    init(s: Int) {
        super.init(c: 55)
        println()
    }
   
}


//let farsan = Farsan()
//let chavanu = Chavanu(c: 22)
let sev = Sev()


class Test {
    convenience init(){
        self.init(val:50)
    }
     init(val:Int){
        println("\(val)")
    }
}

let t1 = Test()
//let t2 = Test(val: 100)












