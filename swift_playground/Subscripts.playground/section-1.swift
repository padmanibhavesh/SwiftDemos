// Playground - noun: a place where people can play

import UIKit

//we can create subscript within only in class , structure and enumerations
//NOTE : we cant create subscript out side of class structure and enumerations
class test{
    subscript(index:Int)->Int{
        get{
            return index
        }
        set(newVlue){
            
        }
    }
    
    //read only subscript
    
    subscript(v1:Int,v2:Int)->Int{
        get{
            return v1*v2
        }
    }
    
    //OR
    
    subscript(v1:Int,v2:Int,v3:Int)->Int{
        return 10
    }
}


struct  TimesTable {
    let multiplier:Int
    
    subscript(index:Int)->Int{
        println(multiplier)
        return index * multiplier
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
threeTimesTable[6] // calling subscripts

//Subscript Usage

var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2


//Subscript Options

struct Matrix {
    
    let rows:Int,columns:Int
    var grid: [Double]
    
    init(rows:Int,columns:Int){
        self.rows=rows
        self.columns=columns
        grid=Array(count: rows*columns, repeatedValue: 0.0)
        
    }
    
    func indexIsValidForRow(row:Int,column:Int)->Bool{
        
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row:Int,column:Int)->Double{
        get{
            println("get called")
            assert(indexIsValidForRow(row, column: column),"Index out of range")
            return grid[(row*columns)+column]
        }
        set{
            println("set called")
          assert(indexIsValidForRow(row, column: column),"Index out of range")
            grid[(row * columns) + column]=newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2


let someValue = matrix[1,0]
















