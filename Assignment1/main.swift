//
//  main.swift
//  Assignment1
//
//  Created by Bryan on 2025-05-30.
//  Student ID: 598856235

import Foundation

startApp()



func startApp(){
    var selection = 0;
    var students : [Student] = []
    
    while(selection != 5){
        drawUI()
        selection = Int(readLine() ?? "0") ?? 0
        switch(selection){
            case 1:
                addStudent(students: &students)
                break
            case 2:
                viewAllStudents(students: students)
                break
            case 3:
                findStudentAvgGrade(students: students)
                break
            case 4:
                showPassingFailing(students: students)
                break
            default:
                selection = 5
                break
        }
    }
    
}

func addStudent(students: inout [Student]){
    var id : Int = 0
    while(true){
        var flag = true;
        print("Enter Student ID: ", terminator: "")
        id = Int(readLine() ?? "0") ?? 0
        
        if(id <= 0){
            print("Id must be a positive integer")
            continue
        }
        
        for i in students {
            if(id == i.id){
                print("Id must be unique")
                flag = false
                break
            }
        }
        
        if(flag){
            break
        }
    }
    
    
    
    print("Enter Student Name: ", terminator: "")
    var name = ""
    while(true){
        name = readLine() ?? ""
        
        if (name == ""){
            print("Name must not be empty")
        }else{
            break
        }
    }
    
    print("Enter Grades (Enter 0 to complete): ")
    var grades : [Double] = []
    while(true){
        var grade = Double(readLine() ?? "0") ?? 0.0
        if(grade == 0){
            break
        }
        else if (grade > 100 || grade < 0){
            print("Grade must be between 1 and 100")
        } else {
            grades.append(grade)
        }
    }
    var student = Student(name: name, id: id, grades: grades)
    
    students.append(student)
    
    print("\(student.toString()) has been added")
}

func viewAllStudents(students: [Student]){
    for i in students{
        print(i.toString() + "\n")
    }
}

func findStudentAvgGrade(students: [Student]){
    print("Enter Student ID: ", terminator: "")
    var id = Int(readLine() ?? "0") ?? 0
    
    for i in students{
        if(i.id == id){
            print(" \(i.name) with Student ID \(i.id) Average grade is \(i.gradeAvg())")
            break
        }
    }
}

func showPassingFailing(students: [Student]){
    print("Enter Passing Threshhold : ", terminator: "")
    var threshold = Double(readLine() ?? "0") ?? 0
    
    for i in students{
        if(i.isPassing(threshold: threshold)){
            print("\(i.name) is passing")
        } else {
            print("\(i.name) is failing")
        }
    }
}

func drawLine(){
    for number in 1...15{
        print("-", terminator: "")
    }
    print("\n")
}

func drawUI(){
    drawLine()
    
    print("1: Add Student\n2: View All Students\n3: Calculate Average Grade\n4: Passing/Failing Students\n5: Exit")
    
    drawLine()
}


