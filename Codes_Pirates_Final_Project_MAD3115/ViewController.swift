//
//  ViewController.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Others on 2022-11-05.
//

import UIKit

class ViewController: UIViewController {

    var employeeData:[[String:String]] = [
                                                    ["Employee_id":"Emp_001",
                                                     "Employee_firstName": "Serge",
                                                     "Employee_lastName":"",
                                                     "Employee_birthYear":"1985",
                                                     "Employee_monthlySalary": "5000",
                                                     "Employee_occupationRate":"100%",
                                                     "Employee_type":"Manager",
                                                     "Employee_spec_number":"10",
                                                     "Employee_vehicle": "Car",
                                                     "Employee_carType": "Sports",
                                                     "Employee_sideCar": "",
                                                     "Employee_vehicleModel":"Lamborghini",
                                                     "Employee_plateNumber":"Custom Plate",
                                                     "Employee_vehicleColor": "White"
                                                    ],
                                                    ["Employee_id":"Emp_002",
                                                     "Employee_firstName": "Peter",
                                                     "Employee_lastName":"Rock",
                                                     "Employee_birthYear":"1975",
                                                     "Employee_monthlySalary": "6000",
                                                     "Employee_occupationRate":"100%",
                                                     "Employee_type":"Programmer",
                                                     "Employee_spec_number":"10",
                                                     "Employee_vehicle": "Motocycle",
                                                     "Employee_carType": "",
                                                     "Employee_sideCar": "True",
                                                     "Employee_vehicleModel": "Honda",
                                                     "Employee_plateNumber":"Custom Plate",
                                                     "Employee_vehicleColor": "Black"
                                                    ]
                                                ]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
        let rowData = employeeData[indexPath.row]
        let name = String(rowData["Employee_firstName"]!) + String(rowData["Employee_lastName"]!)
        let id  = String(rowData["Employee_id"]!)
        cell.textLabel?.text = "Name: \(name)"
        cell.detailTextLabel?.text = "Id: \(id)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let EmployeeDetailsVC = mainSB.instantiateViewController(withIdentifier: "EmployeeDetailsScene") as? EmployeeDetailsVC
        EmployeeDetailsVC?.delegate = self
        
        EmployeeDetailsVC?.selectedEmployee = employeeData[indexPath.row]
        if let EmployeeDetailsVC = EmployeeDetailsVC {
            navigationController?.pushViewController(EmployeeDetailsVC, animated: true)
        }
    }
    
    
}

