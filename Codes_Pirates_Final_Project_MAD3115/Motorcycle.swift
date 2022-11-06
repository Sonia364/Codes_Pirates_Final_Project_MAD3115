//
//  Motorcycle.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Others on 2022-11-06.
//

import Foundation

class Motorcycle: Vehicle{
    
    var model: String
    var plate: String
    var color: String
    var sideCar: Bool
    
    init(model: String, plate: String, color: String, sideCar: Bool) {
        self.model = model
        self.plate = plate
        self.color = color
        self.sideCar =  sideCar
    }
    
    func getFullDetails() -> String {
        var motorDescription: String
        motorDescription = "Employee has a motorcycle\n"
        motorDescription += (self as Vehicle).getDetails()
        if sideCar{
            motorDescription += "\t - With sidecar\n"
        }
        else{
            motorDescription += "\t - Without sidecar\n"
        }
        return motorDescription
    }
  
    
}
