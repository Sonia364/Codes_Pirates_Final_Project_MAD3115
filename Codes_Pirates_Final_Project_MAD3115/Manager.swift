//
//  Manager.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Code Pirates on 2022-11-05.
//

import Foundation

class Manager: Employee{
    var name: String
    var birthYear: Int
    var monthlySalary: Int
    var _rate: Int? = 100
    var employeeVehicle: Vehicle?
   
   // var age: Int
    //var income: Float
    
    init(name: String, birthYear: Int, nbClients: Int, monthlySalary: Int, _rate: Int? = 100,employeeVehicle: Vehicle?=nil) {
        self.name = name
        self.birthYear = birthYear
        self.monthlySalary = monthlySalary
        self._rate = _rate
        self.nbClients = nbClients
        self.employeeVehicle = employeeVehicle
    
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
    
    
    func description()-> String {
        
        let income = annualIncome() + annualBonus()
        var statement: String = ""
        statement = "Name: \(name), a Manager\n"
        statement += "Age: \(age) \n"
        if let managerVehicle = employeeVehicle{
            statement += managerVehicle.getFullDetails()
        }
        statement += "Occupation rate: \(rate!)% \n"
        statement += "Annual income: $\(income) \n"
        statement += "He/She has brought \(nbClients) new clients."
        return  statement

    }
    

    func annualBonus() -> Float {
        return Float(GAIN_FACTOR_CLIENT * nbClients  )
    }
    
}
