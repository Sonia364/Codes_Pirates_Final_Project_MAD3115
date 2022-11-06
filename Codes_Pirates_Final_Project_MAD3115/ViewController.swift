//
//  ViewController.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Others on 2022-11-05.
//

import UIKit

class ViewController: UIViewController {

    var employeeData:[String:[String:String]] = ["Emp_001":
                                                    ["Employee_id":"Emp_001",
                                                     "Employee_firstName": "Serge",
                                                     "Employee_lastName":"",
                                                     "Employee_birthYear":"1985",
                                                     "Employee_monthlySalary": "5000",
                                                     "Employee_occupationRate":"100%",
                                                     "Employee_type":"Manager",
                                                     "Employee_vehicle": "Car",
                                                     "Employee_carType": "Sports",
                                                     "Employee_sideCar": "",
                                                     "Employee_vehicleModel":"Lamborghini",
                                                     "Employee_plateNumber":"Custom Plate",
                                                     "Employee_vehicleColor": "White"
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
        return cell.textLabel.text
    }
    
    
}

