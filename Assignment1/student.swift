//
//  student.swift
//  Assignment1
//
//  Created by Bryan on 2025-05-30.
//

import Foundation

class Student{
    var name = ""
    var id = 0
    var grades : [Double] = []
    
    init(){}
    
    init(name: String, id: Int){
        self.name = name
        self.id = id
    }
    
    init(name: String, id: Int, grades: [Double]){
        self.name = name
        self.id = id
        self.grades = grades
    }
    
    func addGrade(grade: Double){
        grades.append(grade)
    }
    
    func gradeAvg() -> Double{
        var avg: Double = 0
        for i in grades{
            avg += i
        }
        
        return avg / Double(grades.count)
    }
    
    func isPassing(threshold: Double) -> Bool{
        return gradeAvg() > threshold
    }
    
    func toString() -> String{
        var toReturn = "Student Id: \(id) \nName: \(name)"
        
        for i in grades {
            toReturn += "\n Grade: \(i)"
        }
        return toReturn
    }
}
