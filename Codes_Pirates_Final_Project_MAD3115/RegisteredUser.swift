//
//  RegisteredUser.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Others on 2022-11-06.
//

import Foundation

struct RegisteredUser {
    
    let firstName: String
    let lastName: String
    let birthYear: String
    let monthlySalary: String
    let occupationRate: String
    let employeeId: String
    let employeeType: String
    let employeeSpecNumber: String
    let vehicleType: String
    let vehicleCarType: String
    let vehicleSideCar: String
    let vehicleModel: String
    let plateNumber: String
    let vehicleColor: String
    
    static var regUserList =  [RegisteredUser]()

    static func addEmployee(newEmployee: RegisteredUser) -> Bool {
        
        let userExists = self.regUserList.filter{item in
            
            return item.employeeId == newEmployee.employeeId
        }
        
        
        if userExists.isEmpty{
            self.regUserList.append(newEmployee)
            return true
        }
//        if self.regUserList[newEmployee.employeeId] == nil {
//            self.regUserList[newEmployee.employeeId] = newEmployee
//            return true
//        }

        return false
    }
//
//    static func searchUser(email: String) -> RegisteredUser? {
//        if self.userList[email] != nil{
//            return self.userList[email]
//        }
//
//        return nil
//    }
//
//    static func deleteUser(email: String) -> Bool{
//        if self.userList[email] != nil{
//            self.userList[email] = nil
//            return true
//        }
//
//        return false
//    }
}





