//
//  EmployeeDetailsVC.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Others on 2022-11-05.
//

import UIKit

class EmployeeDetailsVC: UIViewController {
    weak var delegate: ViewController?
    var selectedEmployee: [String: String] = [:]
    var employeeObj:  Manager?
        
    @IBOutlet weak var textView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let employeeType = selectedEmployee["Employee_type"]
        let employeeName = selectedEmployee["Employee_firstName"]! + selectedEmployee["Employee_lastName"]!
        let employeebirthYear = Int(selectedEmployee["Employee_birthYear"]!) ?? 0
        let employeeMonthlySalary = Int(selectedEmployee["Employee_monthlySalary"]!) ?? 0
        let employeeSpecNumber = Int(selectedEmployee["Employee_spec_number"]!) ?? 0
        let employeeVehicle = selectedEmployee["Employee_vehicle"]!
        let employeeVehicleModel = selectedEmployee["Employee_vehicleModel"]!
        let employeeVehiclePlate = selectedEmployee["Employee_plateNumber"]!
        let employeeVehicleColor = selectedEmployee["Employee_vehicleColor"]!
        let employeeCarType = selectedEmployee["Employee_carType"]!
        let employeeSideCar = selectedEmployee["Employee_sideCar"]!
        
        if employeeVehicle == "Car"{
            let carObj =  Car(model: employeeVehicleModel, plate: employeeVehiclePlate, color: employeeVehicleColor, type: employeeCarType)
            
            if employeeType == "Manager"{
                employeeObj = Manager(name: employeeName, birthYear: employeebirthYear, nbClients: employeeSpecNumber, monthlySalary: employeeMonthlySalary, employeeVehicle: carObj)
                
            }
        }
        
        textView.text = employeeObj!.description()
    }
    

  
    


}
