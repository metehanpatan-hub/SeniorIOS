//
//  RegisterVC.swift
//  Nghbrhood
//
//  Created by Metehan Patan on 23.02.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var userKey: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var cpass: UITextField!
    @IBOutlet weak var uName: UITextField!
    @IBOutlet weak var eMail: UITextField!
    
    private var pickerArray = ["Resident", "Apartment Manager", "Shop"]
    
    var roww = 0

    @IBOutlet weak var picker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        registerBtn.layer.cornerRadius = 5
        registerBtn.layer.borderWidth = 1
        userKey.isHidden = false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {return 1}
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {return pickerArray.count}
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {return pickerArray[row]}
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch row {
        case 0:
            address.placeholder = "Address"
            userKey.isHidden = false
            userKey.placeholder = "Shared Key"
            address.textContentType = UITextContentType.fullStreetAddress
            roww = row
        case 1:
            address.placeholder = "Address"
            userKey.isHidden = true
            address.textContentType = UITextContentType.fullStreetAddress
            roww = row

        case 2:
            address.placeholder = "Delivery Address"
            userKey.isHidden = false
            userKey.placeholder = "Shop Name"
            address.textContentType = UITextContentType.location
            roww = row

        default:
            address.placeholder = "Address"
            userKey.isHidden = false
            userKey.placeholder = "Shared Key"
            address.textContentType = UITextContentType.fullStreetAddress
            roww = row
            
        }

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    @IBAction func onRegister(_ sender: Any) {
        var ad = String(address.text!) ?? ""
        var uname = String(uName.text!) ?? ""
        var fullname = String(fName.text!) ?? ""
        var pa = String(pass.text!) ?? ""
        var cp = String(cpass.text!) ?? ""
        var em = String(eMail.text!) ?? ""
        var ky = String(userKey.text!) ?? ""
            
        if ad.isEmpty || uname.isEmpty || fullname.isEmpty || pa.isEmpty || cp.isEmpty || em.isEmpty{
            let mAlert = UIAlertController(title: "Error", message: "Missing information!", preferredStyle:UIAlertController.Style.alert)
                mAlert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(mAlert, animated: true, completion: nil)
            }
        else{
            //Authenticate
            if pa != cp {
                let mAlert = UIAlertController(title: "Warning", message: "Passwords are not matching!", preferredStyle: UIAlertController.Style.alert)
                mAlert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
                self.present(mAlert, animated: true, completion: nil)
            }
            else{
                performSegue(withIdentifier: "registerSegue", sender: self)
                let mAlert = UIAlertController(title: "Successful", message: "Registered successfully!", preferredStyle: UIAlertController.Style.alert)
                    mAlert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
                self.present(mAlert, animated: true, completion: nil)
            }
        }
    }
}
