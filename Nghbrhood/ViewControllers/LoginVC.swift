//
//  LoginVC.swift
//  Nghbrhood
//
//  Created by Metehan Patan on 23.02.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import UIKit

class LoginVC: UIViewController{
    
    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var userText: UITextField!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var userType: UISwitch!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var remember: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mButton.layer.cornerRadius = 5
        mButton.backgroundColor = UIColor(red: 6/255, green: 104/255, blue: 181/255, alpha: 1.0)
        //Check Dark or Light Mode
        if traitCollection.userInterfaceStyle == .light {
            logo.image = UIImage(named: "logo")
        }
        else {
            logo.image = UIImage(named: "logo_white")
        }
        var rememberSwitch = UserDefaults.standard.object(forKey: "rememberMe")
        if ((rememberSwitch != nil) == true) {
            let userr = UserDefaults.standard.object(forKey: "userName")
            let passwr = UserDefaults.standard.object(forKey: "password")
            
            userText.text = userr as? String
            pass.text = passwr as? String
        }
        
    }
    
    @IBAction func userSelect(_ sender: UISwitch) {
        if userType.isOn {
            userLabel.text = "Resident"
        }
        else{
            userLabel.text = "Apartment Manager"
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onLogin(_ sender: Any) {
        self.userText.resignFirstResponder()
        self.pass.resignFirstResponder()
        var user = String(userText.text!) ?? ""
        var pss = String(pass.text!) ?? ""
        
        //Remember Me
        if user.isEmpty || pss.isEmpty {
            let mAlert = UIAlertController(title: "Error", message: "Missing username or password!", preferredStyle: UIAlertController.Style.alert)
            mAlert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(mAlert, animated: true, completion: nil)
        }
        else{
            if remember.isOn {
                UserDefaults.standard.setValue(user, forKey: "userName")
                UserDefaults.standard.setValue(pss, forKey: "password")
                UserDefaults.standard.setValue(true, forKey: "rememberMe")
            }
            if remember.isOn == false {
                UserDefaults.standard.setValue(nil, forKey: "userName")
                UserDefaults.standard.setValue(nil, forKey: "password")
                UserDefaults.standard.setValue(false, forKey: "rememberMe")
            }
            //Auth
            let mAlert = UIAlertController(title: "Welcome", message: "Welcome to the Nghbrhood!", preferredStyle: UIAlertController.Style.alert)
            mAlert.addAction(UIAlertAction(title: "Go", style: UIAlertAction.Style.default, handler: {_ in
                CATransaction.setCompletionBlock({
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                })}))
            self.present(mAlert, animated: true, completion: nil)
        }
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
}
