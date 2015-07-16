//Basic Introduction about Variables and Constants,Tuples, Optionals , Assertion
import UIKit


/* We can create constant using let keyword ,
NOTE : we can't change its value later */
let constant_one=500
println(constant_one)

/* We can create variable in swift using var keyword */
var var1="Hi How Are You Guys !!!!"


/* We can declare Also multiple constant and multiple variable in same line with comma separeted */

let constant_two=50,constant_three="constant number is three";
println(constant_two)
println(constant_three)


var var2="hi how are you?",var3=510.120
println(var2);
println(var3)

/* Type Annotations*/

var var4:String
var4="type annotation decalred with variable"

//Note : we can also define type annotation for more than one variable as follow
var red,green,blue:Double
red=10
green=50.20
blue=10.20


/*println and print finction is used for printing the string value*/

println("hi this is println function")
print("hi this is print function")

/* string interpolation*/
var message="Hi Idroid"
println("This is my company : \(message)")

/*semicolons is not required in swift*/
println("hi i have not used semicolon")

//Note : when we use two saperate statement in single line at that time semicolon must be required
println("first message ") ; println("second message")


/*Integer Type*/
//Note : we can get integer minimum and maximum value by suing min and max properties
var intMin=UInt8.min
var intMax=UInt.max

//Integer Conversion
let twoThousands:UInt16=2_000
let one:UInt8=1
let int16Value=twoThousands  +  UInt16(one)


//Integer and Floating Point Conversion

let three=3
let dValue=0.14
let doubleValue=Double(three) + dValue
let intValue=Int(doubleValue)


//Type Aliases

typealias myInt=Int
var typeValue=myInt.max


//Booleans


var yes=true
var no=false

if  yes {
    println("Hurrrraaaaahhhhhh !!!!")
}
else{
    println("OOOPPPPPSSSSss  !!!!!")
}

if no {
    println("Hurrrraaaaahhhhhh !!!!")
}
else{
    
    println("OOOPPPPPSSSSss  !!!!!")
}


let i=1
if i==1{
    println("Hurrrraaaaahhhhhh !!!!")
}

// Tuples

/*compose tuple*/
let http404Error = (404, "Not Found")

/*decompose tuple*/
let (statusCode,statusMessage) = http404Error

println("The status code is \(statusCode)")
println("The Status Message is \(statusMessage)")

let (justStatusCode, _ ) = http404Error
println(justStatusCode)

//access tuple's element individually by using index

println(http404Error.0)
println(http404Error.1)

let http200Status = (statusCode:200,description: "OK")


// Optionals

var optionalVar1 : String?

optionalVar1="bhavesh"

if optionalVar1 != nil {
println(optionalVar1)
println(optionalVar1!)
}
else{
    println("nil value")
    println(optionalVar1)
}



//Assertions

//if condition is true tehn only continue ahead , otherwise  it will terminate process
let age=3
assert(age>0, "age is greater than zero")
println("continue")

let age1=10
assert(age<0,"age is less than zero")
println("terminate here , this will not print")



























