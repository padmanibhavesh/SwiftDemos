//: Playground - noun: a place where people can play

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

















