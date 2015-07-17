//: loops and conditions

import UIKit


//for in loop

for index in 0..<5{
println("\(index)")
}

for index in 1...5{
    println("\(index)")
}

for _ in 1...5{
    println("hello")
}

let naems=["bhavesh","parth","mahesh","ajay","viral"]

for name in naems{
    println("\(name)")
}

let dictionary1=["one":1,"two":2,"three":3,"four":4]

for (key,value) in dictionary1{
println("KEY : \(key) , VALUE : \(value)")
}

for c in "bhavesh padmani"{
println(c)
}

//for loop


for var index=0;index<3;++index {
println(index)
}

var idx:Int
for idx=0;idx<=3;idx++ {
println(idx)
}



//while loop

var start=0
var end = 10
while  start < end{
    println("Game over!")
    start++
}


// do while

var i=1
do{
    println("hello world")
    i++
}while i<=10




//Conditional Statement 


var j=10
if j>=35{
    println(j)
}
else if j != 10 {
    println("j is equal to ten")
}
else
{
    println("default")
}

//switch

let somerchar:Character="i"
switch somerchar{
    case "a":
        println("case a")
    case "b":
        println("case b")
    case "c":
        println("case c")
    case "i":
        println("case i")
    default:
        println("default")
}


switch somerchar{
case "a","e","i","o","u":
    println("value is vowel")
case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":
    println("value is consonent")
default:
    println("other value")
}

let switchNo=10

switch switchNo{
case 1:println("it is 1")
case 2:println("it is 1")
case 3:println("it is 1")
case 4:println("it is 1")
case 10:println("it is 10")

default:println("other")
    
}

let mytuple=(100,200)
switch mytuple{
case (1,2):
    println("values is 1,2 ")
case (_,2000):
    println("value is _ , 200")
case (1000,_):
        println("value is 100 and _")
case (_,_):
    println("value is _ , _")
case (100,200):
    println("value is 100 and 200")
default:
    println("default")
}


let tuple1=(1,2)
switch tuple1{
case (0,0):
    println("case 1")
    
case (-2...1,-2..<2):
    println("case 2")
    
case (-2...1,-2...2):
    println("matchedd")
case (-20...10,_):
    println("case 3")

default:
    println("value is default")
}


//Value Binding

let tuple2=(1,-1)
switch tuple2{
case let (x,y) where x==y :
    println("case 1 is \(x) : \(y)")
case let (x,y) where x == -y:
        println("case 2 is \(x) : \(y)")
case let (x,y):
     println("case 3 is \(x) : \(y)")
default:
    println("default")
}

//continue
let puzzleInput = "bhavesh padmani"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}

//break 

for i in 1...5 {
    switch i{
    case 3:
        break
        println("\(i) never execute")
    default:
        println(i)
    }
}

// fallthrough

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
   fallthrough
default:
    description += " an integer."
}
println(description)









