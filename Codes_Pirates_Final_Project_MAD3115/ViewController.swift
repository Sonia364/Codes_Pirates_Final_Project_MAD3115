//
//  ViewController.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Others on 2022-11-05.
//

import UIKit

class ViewController: UIViewController {

    var regUsers = [RegisteredUser]()
    
    var employeeData:[[String:String]] = [
                                                    ["firstName":"Serge",
                                                     "lastName": "Roy",
                                                     "birthYear":"1985",
                                                     "monthlySalary": "5000",
                                                     "occupationRate":"100%",
                                                     "employeeId":"11",
                                                     "employeeType":"Manager",
                                                     "employeeSpecNumber":"10",
                                                     "vehicleType": "Car",
                                                     "vehicleCarType": "Sports",
                                                     "vehicleSideCar": "",
                                                     "vehicleModel":"Lamborghini",
                                                     "plateNumber":"Custom Plate",
                                                     "vehicleColor": "White"
                                                    ],
                                                    ["firstName":"Emp_001",
                                                     "lastName": "Serge",
                                                     "birthYear":"1985",
                                                     "monthlySalary": "5000",
                                                     "occupationRate":"100%",
                                                     "employeeId":"11",
                                                     "employeeType":"Tester",
                                                     "employeeSpecNumber":"10",
                                                     "vehicleType": "Car",
                                                     "vehicleCarType": "Sports",
                                                     "vehicleSideCar": "",
                                                     "vehicleModel":"Lamborghini",
                                                     "plateNumber":"Custom Plate",
                                                     "vehicleColor": "White"
                                                    ]
                                                ]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(RegisteredUser.regUserList)
        //tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func addEmployee(_ employee: [String:String]){
        employeeData.append(employee)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    

}
extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return employeeData.count
        return RegisteredUser.regUserList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
//        let rowData = employeeData[indexPath.row]
//        let name = String(rowData["firstName"]!) + String(rowData["lastName"]!)
//        let id  = String(rowData["employeeId"]!)
        let rowData = RegisteredUser.regUserList[indexPath.row]
        let name = String(rowData.firstName) + String(rowData.lastName)
        let id  = String(rowData.employeeId)
        cell.textLabel?.text = "Name: \(name)"
        cell.detailTextLabel?.text = "Id: \(id)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let EmployeeDetailsVC = mainSB.instantiateViewController(withIdentifier: "EmployeeDetailsScene") as? EmployeeDetailsVC
        EmployeeDetailsVC?.delegate = self
        
        EmployeeDetailsVC?.selectedEmployee = RegisteredUser.regUserList[indexPath.row]
        if let EmployeeDetailsVC = EmployeeDetailsVC {
            navigationController?.pushViewController(EmployeeDetailsVC, animated: true)
        }
    }
    
    
}

