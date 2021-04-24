//
//  MainPageVC.swift
//  Nghbrhood
//
//  Created by CTIS Student on 27.02.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import UIKit
import Foundation

class MainPageVC: UIViewController {

    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var shopsBtn: UIImageView!
    @IBOutlet weak var billsBtn: UIButton!
    @IBOutlet weak var mdate: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        chatBtn.layer.cornerRadius = 5
        chatBtn.layer.borderWidth = 1
        shopsBtn.layer.cornerRadius = 5
        shopsBtn.layer.borderWidth = 1
        billsBtn.layer.cornerRadius = 5
        billsBtn.layer.borderWidth = 1
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd, hh:mm"
        mdate.text = dateFormatter.string(from: date)
        
        //Check Dark or Light Mode
        if traitCollection.userInterfaceStyle == .light {
            logo.image = UIImage(named: "logo")
        }
        else {
            logo.image = UIImage(named: "logo_white")
        }
    }
    
    @IBAction func backToMain( _ seg: UIStoryboardSegue) {
    }
    @IBAction func onBills(_ sender: UIButton) {
        let mAlert = UIAlertController(title: "Bill Management", message: "", preferredStyle: UIAlertController.Style.alert)
        mAlert.addAction(UIAlertAction(title: "Set Bill Alarm", style: UIAlertAction.Style.default, handler: {_ in
            CATransaction.setCompletionBlock({
                self.performSegue(withIdentifier: "addBills", sender: nil)
            })}))
        mAlert.addAction(UIAlertAction(title: "Pay Bills", style: UIAlertAction.Style.default, handler: {_ in
            CATransaction.setCompletionBlock({
                self.performSegue(withIdentifier: "payBills", sender: nil)
            })}))
        self.present(mAlert, animated: true, completion: nil)
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
