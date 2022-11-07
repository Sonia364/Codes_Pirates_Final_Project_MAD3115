//
//  EmployeeDetailsVC.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Code Pirates on 2022-11-05.
//

import UIKit

class EmployeeDetailsVC: UIViewController {
    
    weak var delegate: ViewController?
    var selectedEmployee: RegisteredUser?
    var employeeObj: Employee?
    var vehichleObj: Vehicle?
    

        
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let employeeType = selectedEmployee!.employeeType
        let employeeName = selectedEmployee!.firstName + " " + selectedEmployee!.lastName
        let employeebirthYear = Int(selectedEmployee!.birthYear) ?? 0
        let employeeMonthlySalary = Int(selectedEmployee!.monthlySalary) ?? 0
        let employeeSpecNumber = Int(selectedEmployee!.employeeSpecNumber) ?? 0
        let employeeVehicle = selectedEmployee!.vehicleType
        let employeeVehicleModel = selectedEmployee!.vehicleModel
        let employeeVehiclePlate = selectedEmployee!.plateNumber
        let employeeVehicleColor = selectedEmployee!.vehicleColor
        let employeeCarType = selectedEmployee!.vehicleCarType
        let employeeSideCar = (selectedEmployee!.vehicleSideCar == "Yes") ? true: false
        
        if employeeVehicle == "Car"{
            vehichleObj =  Car(model: employeeVehicleModel, plate: employeeVehiclePlate, color: employeeVehicleColor, type: employeeCarType)
        }else{
            vehichleObj =  Motorcycle(model: employeeVehicleModel, plate: employeeVehiclePlate, color: employeeVehicleColor, sideCar: employeeSideCar)
            
        }
        
        if employeeType == "Manager"{
            
            employeeObj = Manager(name: employeeName, birthYear: employeebirthYear, nbClients: employeeSpecNumber, monthlySalary: employeeMonthlySalary, employeeVehicle: vehichleObj)
            
        }else if employeeType == "Programmer"{
            
            employeeObj = Programmer(name: employeeName, birthYear: employeebirthYear, nbProjects: employeeSpecNumber, monthlySalary: employeeMonthlySalary, employeeVehicle: vehichleObj)
            
        }
        else if employeeType == "Tester"{
            
            employeeObj = Tester(name: employeeName, birthYear: employeebirthYear, nbBugs: employeeSpecNumber, monthlySalary: employeeMonthlySalary, employeeVehicle: vehichleObj)
            
        }
        
        textView.text = employeeObj!.description()
    }
    

  
    


}
