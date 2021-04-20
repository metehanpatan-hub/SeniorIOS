//
//  BillsMainVC.swift
//  Nghbrhood
//
//  Created by CTIS Student on 28.02.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import UIKit
import WebKit

class BillsMainVC: UIViewController {

    
    @IBOutlet weak var mWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let web_url = URL(string:"https://www.faturamatik.com.tr/tr/hizmetlerimiz/fatura-ode#menu0")!
        let web_request = URLRequest(url: web_url)
        mWebView.load(web_request)
        // Do any additional setup after loading the view.
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
