//
//  Vehicle.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Others on 2022-11-06.
//

import Foundation

protocol Vehicle{
    
    var model: String {get}
    var plate: String {get}
    var color: String {get}
    func getDetails() -> String
    
}

extension Vehicle{
    
    func getDetails() -> String  {
        var vehicleDescription: String
        vehicleDescription = "\t - Make: \(model)\n"
        vehicleDescription += "\t - Plate: \(plate)\n"
        vehicleDescription += "\t - Color: \(color)\n"
        
        return vehicleDescription
    }
    
}



