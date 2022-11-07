//
//  ViewController.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Others on 2022-11-05.
//

import UIKit

class ViewController: UIViewController {
    
    var regUsers = [RegisteredUser]()
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var searchdata =  [RegisteredUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newRegUser =  RegisteredUser(firstName: "Serge", lastName: "Roy", birthYear: "1976", monthlySalary: "5000", occupationRate: "100", employeeId:"12", employeeType: "Manager", employeeSpecNumber: "18", vehicleType:  "Car", vehicleCarType: "Sports", vehicleSideCar: "Yes", vehicleModel:"Honda", plateNumber: "12345", vehicleColor: "White")
        
        //if employeeExists.isEmpty {
        RegisteredUser.addEmployee(newEmployee: newRegUser)
        searchdata = RegisteredUser.regUserList
        print(RegisteredUser.regUserList)
        //tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
}
extension ViewController : UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return employeeData.count
        return searchdata.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
        let rowData = searchdata[indexPath.row]
        let name = String(rowData.firstName) + " " + String(rowData.lastName)
        let id  = String(rowData.employeeId)
        cell.textLabel?.text = "Name: \(name)"
        cell.detailTextLabel?.text = "Id: \(id)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let EmployeeDetailsVC = mainSB.instantiateViewController(withIdentifier: "EmployeeDetailsScene") as? EmployeeDetailsVC
        EmployeeDetailsVC?.delegate = self
        
        EmployeeDetailsVC?.selectedEmployee = searchdata[indexPath.row]
        if let EmployeeDetailsVC = EmployeeDetailsVC {
            navigationController?.pushViewController(EmployeeDetailsVC, animated: true)
        }
    }
    

}

