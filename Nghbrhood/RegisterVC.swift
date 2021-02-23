//
//  RegisterVC.swift
//  Nghbrhood
//
//  Created by Metehan Patan on 23.02.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var textField1: UITextField!

    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField6: UITextField!
    @IBOutlet weak var textField7: UITextField!


    private var pickerArray = ["Resident", "Apartment Manager", "Shop"]

    @IBOutlet weak var picker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {return 1}
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {return pickerArray.count}
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {return pickerArray[row]}
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
        case 0:
            textField1.placeholder = "Address"
            textField2.placeholder = "Shared Key"
            textField3.placeholder = "User Name"
            textField4.placeholder = "Name"
            textField5.placeholder = "Surname"
            textField6.placeholder = "E-mail"
            textField6.isSecureTextEntry = false
            textField7.isSecureTextEntry = true
            textField7.placeholder = "Password"
            textField5.isSecureTextEntry = false
            textField6.isHidden = false
            textField7.isHidden = false
            
        case 1:
            textField1.placeholder = "Address"
            textField2.placeholder = "User Name"
            textField3.placeholder = "Name"
            textField4.placeholder = "Surname"
            textField5.placeholder = "E-mail"
            textField5.isSecureTextEntry = false
            textField6.isSecureTextEntry = true
            textField6.placeholder = "Password"
            textField6.isHidden = false
            textField7.isHidden = true


        case 2:
            textField1.placeholder = "Delivery Address"
            textField2.placeholder = "Shop Name"
            textField3.placeholder = "User Name"
            textField4.placeholder = "E-mail"
            textField5.placeholder = "Password"
            textField5.isSecureTextEntry = true
            textField6.isHidden = true
            textField7.isHidden = true
            
        
        default:
            textField1.placeholder = "Address"
            textField2.placeholder = "Shared Key"
            textField3.placeholder = "User Name"
            textField4.placeholder = "Name"
            textField5.placeholder = "Surname"
            textField6.placeholder = "E-mail"
            textField7.isSecureTextEntry = true
            textField7.placeholder = "Password"
            textField5.isSecureTextEntry = false
            textField6.isHidden = false
            textField7.isHidden = false

        }

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

   

}
