//
//  RegisterVC.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Code Pirates on 2022-11-05.
//

import UIKit

class RegisterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var birthYear: UITextField!
    @IBOutlet weak var monthlySalary: UITextField!
    @IBOutlet weak var occupationRate: UITextField!
    @IBOutlet weak var employeeId: UITextField!
    @IBOutlet weak var vehicleModel: UITextField!
    @IBOutlet weak var plateNumber: UITextField!
    @IBOutlet weak var vehicleType: UISegmentedControl!
    @IBOutlet weak var vehicleColorPicker: UIPickerView!
    @IBOutlet weak var employeeTypePicker: UIPickerView!
    @IBOutlet weak var employeeSpecInput: UITextField!
    @IBOutlet weak var employeeSpecLabel: UILabel!
    @IBOutlet weak var carTypeInput: UITextField!
    @IBOutlet weak var sideCar: UILabel!
    @IBOutlet weak var sideCarType: UISegmentedControl!
    @IBOutlet weak var carType: UILabel!
    
    var employeeTypeData: [String] = []
    var vehicleColorData:  [String] = []
    var vehicleName : String?
    var sideCarValue: String?
    
    weak var delegate: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        employeeTypeData = ["Manager","Programmer","Tester"]
        vehicleColorData = ["Red", "Blue", "Yellow", "Green", "Orange", "Purple", "Pink", "Brown", "White", "Black", "Beige"]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{
            return employeeTypeData.count
        }else{
            return vehicleColorData.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return employeeTypeData[row]
        }else{
            return vehicleColorData[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        if pickerView.tag == 1{
            let selectedValue = employeeTypeData[row]
            employeeSpecLabel.isHidden = false
            employeeSpecInput.isHidden = false
            switch selectedValue{
            case "Manager":
                employeeSpecLabel.text = "# Clients"
            case "Tester":
                employeeSpecLabel.text = "# Bugs"
            case "Programmer":
                employeeSpecLabel.text = "# Projects"
            default:
                employeeSpecLabel.text = "# Clients"
                
            }
            
        }else{
            
        }
        
    }
    
    @IBAction func vehicleTypeSelection(_ sender: Any) {
        vehicleType.selectedSegmentTintColor = .white
        vehicleType.backgroundColor = .lightGray
        
        switch vehicleType.selectedSegmentIndex {
        case 0:
            carType.isHidden = false
            carTypeInput.isHidden = false
            sideCar.isHidden = true
            sideCarType.isHidden = true
            vehicleName = "Car"
            
        case 1 :
            carType.isHidden = true
            carTypeInput.isHidden = true
            sideCar.isHidden = false
            sideCarType.isHidden = false
            vehicleName = "MotorCycle"
            
        default:
            break
        }
        
    }
    
    @IBAction func sideCarSelection() {
        sideCarType.selectedSegmentTintColor = .white
        sideCarType.backgroundColor = .lightGray
        
        switch sideCarType.selectedSegmentIndex {
        case 0:
            sideCarValue = "Yes"
        case 1 :
            sideCarValue = "No"
        default: break
            
        }
    }
    
    
    
    
    @IBAction func registerBtn() {
        
        let infoAlert = UIAlertController(title: "Verify Details!", message:"", preferredStyle: .alert)
        
        for case let textField as UITextField in self.view.subviews {
            if textField.text == "" {

                infoAlert.message = "You should fill all the fields"
                showError(infoAlert)
                return
            }
        }
        
        infoAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in self.displayHomeVC()}))
        infoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(infoAlert, animated: true, completion: nil)
    }
    
    private func showError(_ alert: UIAlertController) {
        let action = UIAlertAction(title: "Retry", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func displayHomeVC(){
        
        let newRegUser =  RegisteredUser(firstName: firstName.text!, lastName: lastName.text!, birthYear: birthYear.text!, monthlySalary: monthlySalary.text!, occupationRate: occupationRate.text!, employeeId:employeeId.text!, employeeType: employeeTypeData[employeeTypePicker.selectedRow(inComponent: 0)], employeeSpecNumber: employeeSpecInput.text!, vehicleType:  self.vehicleName!, vehicleCarType: carTypeInput.text!, vehicleSideCar: "Yes", vehicleModel:vehicleModel.text!, plateNumber: plateNumber.text!, vehicleColor: vehicleColorData[vehicleColorPicker.selectedRow(inComponent: 0)])
        
        
        if RegisteredUser.addEmployee(newEmployee: newRegUser) {
            
            let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = mainSB.instantiateViewController(withIdentifier: "HomeTVScene")
            navigationController?.pushViewController(homeVC, animated: true)
            
        } else {
            let infoAlert = UIAlertController(title: "Employee Details!", message: "An employee with this employee id already exists.", preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(infoAlert,animated: true)
        }
        
    }
    
    
    
    
    
}

