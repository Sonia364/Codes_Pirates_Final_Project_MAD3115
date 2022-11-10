//
//  ViewController.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Code Pirates on 2022-11-05.
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
        
        RegisteredUser.addEmployee(newEmployee: newRegUser)
        
        let newRegUser2 =  RegisteredUser(firstName: "Mathew", lastName: "Radford", birthYear: "1986", monthlySalary: "6000", occupationRate: "80", employeeId:"13", employeeType: "Programmer", employeeSpecNumber: "10", vehicleType:  "Motorcycle", vehicleCarType: "", vehicleSideCar: "Yes", vehicleModel:"BMW", plateNumber: "5678", vehicleColor: "Blue")
        
        RegisteredUser.addEmployee(newEmployee: newRegUser2)
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchdata = RegisteredUser.regUserList
        
        tableView.reloadData()
    }
    
}
extension ViewController : UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    //MARK:- SEARCH BAR DELEGATE METHOD FUNCTION
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.text = ""
        searchdata = RegisteredUser.regUserList
        searchBar.endEditing(true)
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        searchdata = searchText.isEmpty ? RegisteredUser.regUserList : RegisteredUser.regUserList.filter
        {
            (item: RegisteredUser) -> Bool in
            return item.firstName.contains(searchText) || item.lastName.contains(searchText) || item.employeeId.contains(searchText)
        }
        tableView.reloadData()
    }
}

