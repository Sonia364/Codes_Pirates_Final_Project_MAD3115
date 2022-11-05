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
        //vehicleType.selectedSegmentTintColor = .blue
        switch vehicleType.selectedSegmentIndex {
                case 0:
                   // some code
            vehicleType.selectedSegmentTintColor = .white
            vehicleType.backgroundColor = .gray
                case 1 :
                  // some code
            vehicleType.backgroundColor = .gray
                default:
                    break
                }
                
    }
    
    


}

