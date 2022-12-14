//
//  Employee.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Code Pirates on 2022-11-05.
//

import Foundation

protocol Employee{
    
    var name: String {get}
    var birthYear: Int {get}
    var monthlySalary: Int {get}
    var _rate: Int?  {get set}
    var rate: Int? { get set }
    var age: Int { get}
    //var income : Float { get }
    var employeeVehicle : Vehicle? {get}
    //var contract : Contract?
    func description()-> String
    func annualIncome()-> Float
    
}



extension Employee{
    var age: Int {
        return Calendar.current.component(.year, from: Date())-birthYear
    }
    
    var rate: Int?{
        
        get{
            return _rate
        }
        set(newVal){
            if newVal! < 10{
                _rate = 10
            }else if newVal! > 100{
                _rate = 100
            }else{
                _rate = newVal!
            }
        }
    }
        
    func annualIncome()-> Float{
            let yearlyIncome = 12 * (monthlySalary * rate!)
            return Float(yearlyIncome)
        }
}


