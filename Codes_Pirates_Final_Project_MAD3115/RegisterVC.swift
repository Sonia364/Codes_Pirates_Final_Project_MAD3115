//
//  RegisterVC.swift
//  Codes_Pirates_Final_Project_MAD3115
//
//  Created by Others on 2022-11-05.
//

import UIKit

class RegisterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    
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
        vehicleType.backgroundColor = .cyan
        
        switch vehicleType.selectedSegmentIndex {
            case 0:
                carType.isHidden = false
                carTypeInput.isHidden = false
                sideCar.isHidden = true
                sideCarType.isHidden = true
                
            case 1 :
                carType.isHidden = true
                carTypeInput.isHidden = true
                sideCar.isHidden = false
                sideCarType.isHidden = false
              
            default:
                break
        }
                
    }
    
    
    @IBAction func registerBtn() {
        
        let infoAlert = UIAlertController(title: "Verify Details!", message:"", preferredStyle: .alert)
        
        for case let textField as UITextField in self.view.subviews {
            if textField.text == "" {
                // show error
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
        
//        let newUser = User(name: txtName.text!, address: txtAddress.text!, contactNumber: txtContactNumber.text!, postalCode: txtPostalCode.text!, city: cityList[pickCity.selectedRow(inComponent: 0)], email: txtEmail.text!, password: txtPassword.text!, gender: self.gender, dob: pickDOB.date)
//
//        if User.addUser(newUser: newUser) {
//            let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let homeVC = mainSB.instantiateViewController(withIdentifier: "HomeTVScene")
//            navigationController?.pushViewController(homeVC, animated: true)
//        } else {
//            let infoAlert = UIAlertController(title: "User Account", message: "An account with this email address already exist.", preferredStyle: .alert)
//            infoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//            self.present(infoAlert,animated: true)
//        }
        
        
//        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let homeVC = mainSB.instantiateViewController(withIdentifier: "HomeScene")
//        navigationController?.pushViewController(homeVC, animated: true)
    }
    


}

