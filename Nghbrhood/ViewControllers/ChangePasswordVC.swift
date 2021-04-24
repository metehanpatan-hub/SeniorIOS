//
//  ChangePasswordVC.swift
//  Nghbrhood
//
//  Created by CTIS Student on 28.02.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var txEmail: UITextField!
    @IBOutlet weak var txOldPass: UITextField!
    @IBOutlet weak var txNewPass: UITextField!
    @IBOutlet weak var uname: UITextField!
    @IBOutlet weak var changeBtn: UIButton!
    @IBOutlet weak var cpass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeBtn.layer.cornerRadius = 5
        changeBtn.layer.borderWidth = 1
        
        //Check Dark or Light Mode
        if traitCollection.userInterfaceStyle == .light {
            logo.image = UIImage(named: "logo")
        }
        else {
            logo.image = UIImage(named: "logo_white")
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func onChange(_ sender: Any) {
        var usname = String(uname.text!) ?? ""
        var mail = String(txEmail.text!) ?? ""
        var old = String(txOldPass.text!) ?? ""
        var new = String(txNewPass.text!) ?? ""
        var con = String(cpass.text!) ?? ""
        
        if mail.isEmpty || old.isEmpty || new.isEmpty || usname.isEmpty || con.isEmpty {
            let mAlert = UIAlertController(title: "Error", message: "Missing mail or password!", preferredStyle: UIAlertController.Style.alert)
            mAlert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(mAlert, animated: true, completion: nil)
        }
        else
        {
            if old == new {
                let mAlert = UIAlertController(title: "Warning", message: "New password can't be the same as your old password!", preferredStyle: UIAlertController.Style.alert)
                mAlert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
                self.present(mAlert, animated: true, completion: nil)
            }
            else{
                let mAlert = UIAlertController(title: "Successful", message: "Password changed!", preferredStyle: UIAlertController.Style.alert)
                mAlert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: {_ in
                    CATransaction.setCompletionBlock({
                        self.performSegue(withIdentifier: "backToLogin", sender: self)
                    })}))
                self.present(mAlert, animated: true, completion: nil)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
