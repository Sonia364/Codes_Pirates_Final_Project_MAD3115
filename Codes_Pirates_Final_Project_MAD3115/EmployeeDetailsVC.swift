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
        
        if employeeType == "Manager"{
             employeeObj = Manager(name: employeeName, birthYear: employeebirthYear, monthlySalary: employeeMonthlySalary)
        }
        
        textView.text = employeeObj!.description()
    }
    

  
    


}
