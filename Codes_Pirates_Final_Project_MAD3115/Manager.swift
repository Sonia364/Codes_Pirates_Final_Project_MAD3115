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
    var income: Float
    
    
    private let GAIN_FACTOR_CLIENT = 500
    private let GAIN_FACTOR_TRAVEL = 100
   
   
    var _nbTravelDays: Int = 0
    var nbTravelDays: Int{
        get{
            return _nbTravelDays
        }
        set(newVal){
            if newVal > 0{
                _nbTravelDays = newVal
            }
            else{
                print("error must be greater than 0")
            }
            
        }
    }
    var _nbClients: Int = 0
    var nbClients: Int{
        get{
            return _nbClients
        }
        set(newVal){
            _nbClients = newVal
        }
    }
    init(name: String, birthYear: Int, nbClients: Int, nbTravelDays: Int, rate: Int?=100, employeeVehicle: Vehicle?=nil ) {
        super.init(name: name, birthYear: birthYear, monthlySalary: 0, rate: rate!, employeeVehicle: employeeVehicle)
        self.nbTravelDays = nbTravelDays
        self.nbClients = nbClients
        income = annualIncome()
        print("We have a new employee: \(name), a manager.")
   }
    //var contract = contractInfo()
    
    var description: String {
        var statement: String = ""
        statement = "Name: \(name), a Manager\n"
        statement += "Age: \(age) \n"
        if let managerVehicle = employeeVehicle{
            statement += managerVehicle.getDetails()
        }
        statement += "\(name) has an Occupation rate: \(rate!)% He/She travelled \(nbTravelDays) days and has brought \(nbClients) new clients.\n"
        
        statement += "His/Her estimated annual income is \(income)"
        
        return  statement
        
        
    }
    
    
    override func signContract(contract: Contract) {
        super.signContract(contract: contract)
        var amount = 0
        if let c = contract as? Permanent {
            amount = c.getFinalAmount()

        }
        if let c = contract as? Temporary {
            amount = c.getFinalAmount()
        }
        
        let  bonus = Float(GAIN_FACTOR_CLIENT * nbClients + GAIN_FACTOR_TRAVEL * nbTravelDays)
        var b = amount * Int(rate!)/100
        b = b * 12
        b = b + Int(bonus)
        income = Float(b)
        
    }
    
   override func annualIncome() -> Float {
       return Float(GAIN_FACTOR_CLIENT * nbClients + GAIN_FACTOR_TRAVEL * nbTravelDays)
    }
    
    
    override func contractInfo() -> String {
        if let c = contract as? Permanent {
            return ("\(name) is a manager. he is married and he/she has \(c.nbChildren) children.He/She has worked for  \(c.accumulatedDays) days and upon contract his/her monthly salary is \(c.monthlySalary)")
        }
        if let c = contract as? Temporary {
            return ("\(name) is a manager. he is a temporary employee with \(c.hourlySalary) hourly salary and he has worked for \(c.accumulatedHours) hours")
        }
        return ""
    }
}
