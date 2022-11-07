//
//  Programmer.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Others on 2022-11-06.
//

import Foundation

class Programmer: Employee{
    var name: String
    var birthYear: Int
    var monthlySalary: Int
    var _rate: Int? = 100
    var employeeVehicle: Vehicle?
   
   // var age: Int
    //var income: Float
    
    init(name: String, birthYear: Int, nbProjects: Int, monthlySalary: Int, _rate: Int? = 100,employeeVehicle: Vehicle?=nil) {
        self.name = name
        self.birthYear = birthYear
        self.monthlySalary = monthlySalary
        self._rate = _rate
        self.nbProjects = nbProjects
        self.employeeVehicle = employeeVehicle
    
    }
    
    private let GAIN_FACTOR_PROJECTS = 200
    
    var _nbProjects: Int = 0
    var nbProjects: Int{
        get{
            return _nbProjects
        }
        set(newVal){
            _nbProjects = newVal
        }
    }
    
    
    //var contract = contractInfo()
    
    func description()-> String  {
        
        let income = annualIncome() + annualBonus()
        var statement: String = ""
        statement = "Name: \(name), a Programmer\n"
        statement += "Age: \(age) \n"
        if let managerVehicle = employeeVehicle{
            statement += managerVehicle.getFullDetails()
        }
        statement += "Occupation rate: \(rate!)% \n"
        statement += "Annual income: $\(income) \n"
        statement += "He/She has completed \(nbProjects) Projects."
        return  statement

    }
    

    func annualBonus() -> Float {
        return Float(GAIN_FACTOR_PROJECTS * nbProjects  )
    }
    
}
