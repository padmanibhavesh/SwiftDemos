//: function practice

import UIKit



func test(){
    println("without argument and without return")
}
test()

func test1(para1:Int){
println("with argument and without return : \(para1)")
}
test1(1000)


func test2()->String{
return "without argument and with return"
}
println(test2())

func test3(para1:Int)->Int{
    println("with orgument and with return  \(para1)")
    return para1
}
println(test3(500))


//function with multiple return values

func test4(myArray:[Int])->(min:Int,max:Int){
    return (myArray[0],myArray[1])
}

let var1=test4([10,20])
println(var1.min)
println(var1.max)


func test5(strArr:[String])->(str1:String,str2:String)?{
    if strArr.isEmpty{
    return nil
    }
    return (String(strArr.count),String(strArr.capacity))
}

let var2=test5(["bhavesh","parth","ketan","tejash bday boy"])
println("\(var2!.str1) : \(var2!.str2)")

let var3=test5(["one","two","three"])!
println(var3.str1)
println(var3.str2)


func test6(intArr:[Int])->(val1: Int ,val2 : Int)?{
    if intArr.isEmpty{
        return nil
    }
    return (intArr.last! , intArr.first!)

}
let var4=test6([10,20,30])!
println(var4.val1)
println(var4.val2)


func test7(s1:String,s2:String,joiner :String)->String{
return s1+joiner+s2
    
}
test7("bhavesh","padmani","_")

//External Parameter Names
func test8(string s1:String,toString s2:String,withJoiner joiner:String)->String{
return s1+joiner+s2
}

test8(string: "padmani", toString: "bhavesh", withJoiner: "::")


func test9(#str1:String,#str2:String,#joiner:String)->String{

    return str1+joiner+str2
}

test9(str1: "bhavesh", str2: "padmani", joiner: "--")



//Default Parameter Values

func test10(str1:String ,str2:String,strDefault:String=" and ")->String{
return str1+strDefault+str2
}

test10("bhavesh","Parth")
test10("abc", "xyz", strDefault:"__")


//Variadic Parameters

func test11(numbers:Int...){
    for i in numbers{
        println(i)
    }
}
test11(1,2,3,4,5,6)

func test12(val1:Int,val2:Int,variadicNo:Int...){
    println(val1)
    println(val2)
    println(variadicNo.count)

}
test12(1,2,3,4,5,6)

//Constant and Variable Parameters
//NOTE : function parameter variable is by default constant , so we can't modifi it's value directlly, we have to write var keyword before it's name
func test13(var val1:Int,var strval1:String){
    val1+=10
    println(val1)
    strval1+=" padmani"
    println(strval1)
}
test13(50,"bhavesh")

//In-Out Parameters
//It is pass by reference

func test14(inout a : Int, inout b:Int){
    let temp=a
    a=b
    b=temp

}
var someInt=10
var otherInt=20
test14(&someInt, &otherInt)
println(someInt)
println(otherInt)


//Function Types

func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

func printHelloWorld(){
println("hello , world")
}
println(printHelloWorld())

//Using Function Types

var mathFunction:(Int,Int) -> Int = addTwoInts
println("Result : \(mathFunction(10,20))")

mathFunction = multiplyTwoInts
println("Result : \(mathFunction(5,5))")

var mathFunction1 = multiplyTwoInts
println("Result : \(mathFunction1(10,200))")

let anotherMathFunction = addTwoInts
println(anotherMathFunction(2,3))

let anotherMathFunction1:(Int,Int)-> Int = addTwoInts
println(anotherMathFunction1(2,5))


//Function Types as Parameter Types

var t1:Int
func printMathResult(t1: (Int, Int) -> Int, a: Int, b: Int) {
    println("Result: \(t1(a, b))")
}
printMathResult(addTwoInts, 5, 5)


func printMathResult1(var t2:(Int,Int)->Int, a: Int, b: Int) {
    println("Result: \(t2(a, b))")
}
printMathResult1(addTwoInts, 50, 50)

//Function Types as Return Types

func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}
var currentValue = 3
let x = chooseStepFunction(currentValue > 0)
println(x(10))

var currentValue1 = -3
let y:(Int)->Int=chooseStepFunction(currentValue1 > 0)
println("\(y(5))")

//Nested Functions


func outerFunction(backwards: Bool) -> (Int) -> Int
{
    func inner1(input: Int) -> Int {
        return input + 1
    }
    func inner2(input: Int) -> Int {
        return input - 1
    }
    return backwards ? inner1 : inner2
}

var flag = 4

let moveNearerToZero = outerFunction(flag < 0)

// moveNearerToZero now refers to the nested stepForward() function

while flag != 0 {
    
    println("\(flag)... ")
    
    flag = moveNearerToZero(flag)
}
println("zero!")


func outerFunc(v1:String)->(Int)->Int{
    
    func square(v2:Int)->Int{
       return v2*v2
    }
    func qube(v3:Int)->Int{
        return v3*v3*v3
    }
    switch v1{
        case "square":
            return square
        case "qube":
            return qube
        default:
            return square
    }
    
}

var qube=outerFunc("qube")
var q=qube(30)






