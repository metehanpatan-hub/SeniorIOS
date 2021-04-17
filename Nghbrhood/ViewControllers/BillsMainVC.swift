//
//  BillsMainVC.swift
//  Nghbrhood
//
//  Created by CTIS Student on 28.02.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import UIKit

class BillsMainVC: UIViewController {

    @IBOutlet weak var mBills: UIButton!
    @IBOutlet weak var addBills: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mBills.layer.cornerRadius = 5
        mBills.layer.borderWidth = 1
        addBills.layer.cornerRadius = 5
        addBills.layer.borderWidth = 1
    }
    @IBAction func backToBill( _ seg: UIStoryboardSegue) {
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
