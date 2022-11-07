//
//  Tester.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Code Pirates on 2022-11-06.
//

import Foundation

class Tester: Employee{
    var name: String
    var birthYear: Int
    var monthlySalary: Int
    var _rate: Int? = 100
    var employeeVehicle: Vehicle?

    
    init(name: String, birthYear: Int, nbBugs: Int, monthlySalary: Int, _rate: Int? = 100,employeeVehicle: Vehicle?=nil) {
        self.name = name
        self.birthYear = birthYear
        self.monthlySalary = monthlySalary
        self._rate = _rate
        self.nbBugs = nbBugs
        self.employeeVehicle = employeeVehicle
    
    }
    
    private let GAIN_FACTOR_ERROR = 10
    
    var _nbBugs: Int = 0
    var nbBugs: Int{
        get{
            return _nbBugs
        }
        set(newVal){
            _nbBugs = newVal
        }
    }
    
    
    func description()-> String {
        
        let income = annualIncome() + annualBonus()
        var statement: String = ""
        statement = "Name: \(name), a Tester\n"
        statement += "Age: \(age) \n"
        if let managerVehicle = employeeVehicle{
            statement += managerVehicle.getFullDetails()
        }
        statement += "Occupation rate: \(rate!)% \n"
        statement += "Annual income: $\(income) \n"
        statement += "He/She has corrected \(nbBugs) bugs."
        return  statement

    }
    

    func annualBonus() -> Float {
        return Float(GAIN_FACTOR_ERROR * nbBugs  )
    }
    
}

