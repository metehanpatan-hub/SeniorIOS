//
//  WelcomeVC.swift
//  Nghbrhood
//
//  Created by CTIS Student on 16.02.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func onTheme(_ sender: UISwitch) {
        if sender.isOn {
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .light
            }
            logo.image = UIImage(named: "logo")
        }
        else{
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .dark
            }
            logo.image = UIImage(named: "logo_white")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerButton.layer.cornerRadius = 5
        loginBtn.layer.cornerRadius = 5
        registerButton.backgroundColor = UIColor(red: 6/255, green: 104/255, blue: 181/255, alpha: 1.0)
        loginBtn.backgroundColor = UIColor(red: 6/255, green: 104/255, blue: 181/255, alpha: 1.0)
        //Check Dark or Light Mode
        if traitCollection.userInterfaceStyle == .light {
            logo.image = UIImage(named: "logo")
        }
        else {
            logo.image = UIImage(named: "logo_white")
        }
    }
    @IBAction func backToLogin( _ seg: UIStoryboardSegue) {
    }
    @IBAction func backToLogin2( _ seg: UIStoryboardSegue) {
    }
    
}
