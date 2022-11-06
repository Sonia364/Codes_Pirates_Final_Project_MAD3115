//
//  Car.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Others on 2022-11-06.
//

import Foundation

class Car: Vehicle{
    
    var model: String
    var plate: String
    var color: String
    var type: String
    
    init(model: String, plate: String, color: String, type: String ) {
        self.model = model
        self.plate = plate
        self.color = color
        self.type = type
    }
    
    func getFullDetails()-> String{

        var carDescription: String
        carDescription = "Employee has a car \n"
        carDescription +=  (self as Vehicle).getDetails()
        carDescription += "\t - Type: \(type)\n"

        return carDescription
    }
    
}
