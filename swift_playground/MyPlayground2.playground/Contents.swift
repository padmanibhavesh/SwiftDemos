//Collections

import UIKit

//Array

var arrInt=[Int]()
println("arrInt is of type [Int] with \(arrInt.count) item.")
arrInt.append(100)
println("arrInt is of type [Int] with \(arrInt.count) item.")
arrInt=[]
println("arrInt is of type [Int] with \(arrInt.count) item.")


var threeDoubles=[Double](count: 3, repeatedValue:10.10)
var otherThreeDoubles=[Double](count: 3, repeatedValue:30.30)
var sixDoubles=threeDoubles + otherThreeDoubles




//Accessing and modifying Array

var stringArr:[String]=["bhavesh","parth","ketan"]
println(stringArr.count)

if stringArr.isEmpty{
println("Array Is Empty")
}
else
{
    println("Array Is not Empty")
}

stringArr.append("tejash")

stringArr+=["sagar","mahesh"]


var firstItem=stringArr[0]

stringArr[0]="viren"

println(stringArr)

stringArr[2...4]=["abc","xyz","pqr"]

println(stringArr)


stringArr.insert("insert", atIndex:0)
let removeIdx=stringArr.removeAtIndex(0)
let last = stringArr.removeLast()

//Iterating Array

for item in stringArr{
    println(item)
}

//Iterating Array With enumerate

for (idx,val) in enumerate(stringArr){
    println("Index Is : \(idx+1) , Value is : \(val)")
}



//SET


var mySet=Set<Character>()
println(mySet.count)

mySet.insert("a")
mySet=[]

//Set With Array Literals
var myset1: Set<String>=["bhavesh","parth","ketan","123","567"]

//Accessing And Modifying Set

if myset1.isEmpty{
println("set is empty")
}
else
{
    println("set is not empty")
}

if myset1.contains("bhavesh"){
println("yes it is containing element")
}
else
{
    println("it is not containing an element")
}

//Iterating Set

for item in myset1{
println(item)
}

//Constructing Sets

let oddDigits: Set=[1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

let unionSet=sorted(oddDigits.union(evenDigits))
println("Items in union set is : \(unionSet.count) , unionSet value is : \(unionSet)")


let intersectSet=sorted(oddDigits.intersect(singleDigitPrimeNumbers))

let subtractSet=sorted(oddDigits.subtract(singleDigitPrimeNumbers))

let exclusiveOrSet=sorted(oddDigits.exclusiveOr(singleDigitPrimeNumbers))


if oddDigits.isSubsetOf(evenDigits){
println("YES")
}
else
{
    println("NO")
}


if oddDigits.isSupersetOf(evenDigits){
    println("YES")
}
else
{
    println("NO")
}


if oddDigits.isDisjointWith(evenDigits){
    println("YES")
}
else
{
    println("NO")
}




//Dictionaries

var dic1=[Int:String]()
dic1[16]="bhavesh"
println(dic1)

var dic2:[String:String]=["1":"bhavesh","2":"parth","3":"haresh"]

if dic2.isEmpty{
println("dictionary is empty")
}
else
{
    println("Not Empty")
}

dic2["4"]="ketan"

println(dic2)

let oldval=dic2.updateValue("updated", forKey: "1")
println(oldval)

if let oldvalue=dic2.updateValue("bhavesh", forKey: "1"){
    println(oldvalue)
}
else
{
    println("index is not available")
}
println(dic2)


if var removedValue=dic2.removeValueForKey("1"){
println(removedValue)
}

//Iterating Dictionary

for (mKey,mValue)in dic2{
println("Key : \(mKey) , Value : \(mValue)")
}



// Iterating Only Keys

for mKey in dic2.keys{
println(mKey)
}

// Iterating Only Values

for mValue in dic2.values{
    println(mValue)
}

let keys=[String](dic2.keys)
let values=[String](dic2.values)














