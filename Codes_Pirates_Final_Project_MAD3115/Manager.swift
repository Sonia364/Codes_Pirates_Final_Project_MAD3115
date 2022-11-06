//
//  Manager.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Others on 2022-11-05.
//

import Foundation

class Manager: Employee, CustomStringConvertible {
    var name: String
    var birthYear: Int
    var monthlySalary: Int
    var _rate: Int?
    var age: Int
    //var income: Float
    
    init(name: String, birthYear: Int, monthlySalary: Int, _rate: Int? = nil, age: Int) {
        self.name = name
        self.birthYear = birthYear
        self.monthlySalary = monthlySalary
        self._rate = _rate
        self.age = age
        
    }
    
    private let GAIN_FACTOR_CLIENT = 500
    
    var _nbClients: Int = 0
    var nbClients: Int{
        get{
            return _nbClients
        }
        set(newVal){
            _nbClients = newVal
        }
    }
    
    
    //var contract = contractInfo()
    
    var description: String {
        let income = annualIncome() + annualBonus()
        var statement: String = ""
        statement = "Name: \(name), a Manager\n"
        statement += "Age: \(age) \n"
        //        if let managerVehicle = employeeVehicle{
        //            statement += managerVehicle.getDetails()
        //        }
        statement += "Occupation rate: \(rate!)% \n"
        
        statement += "Annual income: $\(income) \n"
        statement += "He/She has brought \(nbClients) new clients."
        return  statement
        
        
    }
    

    func annualBonus() -> Float {
        return Float(GAIN_FACTOR_CLIENT * nbClients  )
    }
    
}
