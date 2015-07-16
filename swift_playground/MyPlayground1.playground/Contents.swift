//String and Character

import UIKit



let someString="some string literal value"
var emptyString=""
var anotherEmptyString=String()

if emptyString.isEmpty{
println("Yes Empty")
}

var variableString="Bhavesh"
variableString+="Padmani"

let constantString="Parth"
//constantString+="Dobariya"


for c in variableString {
    println(c)
}

let constantCharacter: Character="A"

let charArr: [Character]=["B","C","D"]
let dString=String(charArr)
println(dString)

let string1="hello,"
let string2=" are you there?"
var welcome=string1+string2

let char:Character="h"
welcome.append(char)


let numValue=100
let message=" \(numValue) times 2.5 is \(Double(numValue) * 2.5) "
println("total chars is : \(count(message))")

let greeting="bhavesh padmani"
println(greeting.startIndex)
println(greeting.endIndex)
println(greeting[greeting.startIndex])
println(greeting[greeting.startIndex.successor()])
println(greeting[greeting.endIndex.predecessor()])

let index=advance(greeting.startIndex,5)
greeting[index]

for index in indices(greeting){
print("\(greeting[index])")
}
println("\n")

//NOTE : Working on mutable String

var mutableString="This is mutable string"

//insert character into string
println(mutableString)
mutableString.insert("W", atIndex: mutableString.startIndex)

//insert substring at specific index into string
println(mutableString)
mutableString.splice(" kem 6o ?", atIndex:mutableString.endIndex.predecessor())

//remove character from string on specific index
println(mutableString)
mutableString.removeAtIndex(mutableString.endIndex.predecessor())


//remove substring at a specified range
println(mutableString)
let range=advance(mutableString.endIndex, -7)..<mutableString.endIndex
mutableString.removeRange(range)


//Comparing String 

var str1="Hello How Are You ?"
var str2="Hello How Are You ?"
if str1 == str2{
    println("yes")
}
if str1 != str2{
    println("No")
}
else
{
    println("yes")
}

//Compare prefix
let mydictionary = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
var preNo=0
for s in mydictionary{
    if s.hasPrefix("Act 2 "){
        ++preNo
    }
}
println(preNo)


//compare suffix

var suffNo=0
for s in mydictionary{
    if s.hasSuffix("cell"){
        ++suffNo
    }
}
println(suffNo)


//Unicode Representation Stirng

//UTF-8 Representation
let dogString = "Dog‼🐶"

for codeUnit in dogString.utf8{
println("\(codeUnit)")
}
println("\n")


//UTF-16 Representation

for codeUnit in dogString.utf16{
    println("\(codeUnit)")
}
println("\n")

// Unicode Scalar Representation
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ")
    print("\(scalar) ")
}






















