//
//  AddBillsVC.swift
//  Nghbrhood
//
//  Created by CTIS Student on 28.02.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import UIKit
import EventKit

class AddBillsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    private var pickerArray = ["Water", "Electric", "Gas", "Internet"]
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var datePick: UIDatePicker!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var bName: UITextField!
    @IBOutlet weak var amount: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        typePicker.dataSource = self
        typePicker.delegate = self
        // Do any additional setup after loading the view.
        addBtn.layer.cornerRadius = 5
        addBtn.layer.borderWidth = 1
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {return 1}
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {return pickerArray.count}
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {return pickerArray[row]}
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {}
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    @IBAction func onAdd(_ sender: UIButton) {
        var name = String(bName.text!) ?? ""
        var pay = String(amount.text!) ?? ""
        
        if name.isEmpty || pay.isEmpty {
            let mAlert = UIAlertController(title: "Error", message: "Missing name or bill amount!", preferredStyle: UIAlertController.Style.alert)
            mAlert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(mAlert, animated: true, completion: nil)
        }
        else{
            //Add Bill Operation
            let mAlert = UIAlertController(title: "Successful", message: "Bill added to reminder!", preferredStyle: UIAlertController.Style.alert)
            mAlert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
            self.present(mAlert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                self.performSegue(withIdentifier: "backToBill", sender: self)
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
