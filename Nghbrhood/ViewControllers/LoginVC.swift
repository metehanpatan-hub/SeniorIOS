//
//  LoginVC.swift
//  Nghbrhood
//
//  Created by Metehan Patan on 23.02.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import UIKit

class LoginVC: UIViewController{
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var userText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mButton.layer.cornerRadius = 5
        mButton.layer.borderWidth = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onLogin(_ sender: Any) {
        self.userText.resignFirstResponder()
        self.pass.resignFirstResponder()
        var user = String(userText.text!) ?? ""
        var pss = String(pass.text!) ?? ""
        
        if user.isEmpty || pss.isEmpty /*userText.text!.isEmpty || pass.text!.isEmpty*/ {
            let mAlert = UIAlertController(title: "Error", message: "Missing username or password!", preferredStyle: UIAlertController.Style.alert)
            mAlert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(mAlert, animated: true, completion: nil)
        }
        else{
            //Auth
            let mAlert = UIAlertController(title: "Welcome", message: "Welcome to the Nghbrhood!", preferredStyle: UIAlertController.Style.alert)
            mAlert.addAction(UIAlertAction(title: "Go", style: UIAlertAction.Style.default, handler: {_ in
                CATransaction.setCompletionBlock({
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                })}))
            self.present(mAlert, animated: true, completion: nil)
        }
    }
    /*
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }*/
    
}
