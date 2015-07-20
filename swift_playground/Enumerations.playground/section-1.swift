// Enumerations

import UIKit


enum CompassPoint{

    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune
}

var directionToHead=CompassPoint.East
println(directionToHead.hashValue)
directionToHead = .West
println(directionToHead.hashValue)

directionToHead = .North
switch directionToHead{
case .North:
    println("North")
case .South:
    println("South")
case .East:
    println("East")
case .West:
    println("West")
}


let somePlanet=Planet.Mercury

switch somePlanet{
case .Venus:
    println("Mercury")
default:
    println("default")
}


//Associated Values

enum Barcode{
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(10 ,20, 30, 40)
//productBarcode = Barcode.QRCode("Bhavesh Padmani")



switch productBarcode{
case .UPCA(let first,let second,let third,let fourth):
    println("first:\(first) second : \(second) third : \(third) fourth :\(fourth)")
case .QRCode(let productCode):
    println("product code : \(productCode)")
    
}


//Raw Values

enum ASCIIControlCharacter : Character{
    
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum Planet1: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

let earthsOrder = Planet1.Neptune.rawValue


//Initializing from a Raw Value

let possiblePlanet = Planet1(rawValue: 7)
println(possiblePlanet)

let positionToFind = 9
if let somePlanet = Planet1(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        println("Mostly harmless")
    default:
        println("Not a safe place for humans")
    }
}
else {
    println("There isn't a planet at position \(positionToFind)")
}








