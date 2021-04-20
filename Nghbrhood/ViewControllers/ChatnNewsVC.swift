//
//  ChatnNewsVC.swift
//  Nghbrhood
//
//  Created by CTIS Student on 28.02.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import UIKit
import WebKit

class ChatnNewsVC: UIViewController {

    @IBOutlet weak var mWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Test URL
        //let web_url = URL(string: "https://www.google.com.tr/?client=safari")!
        //Real URL
        let web_url = URL(string:"http://94.103.47.43:3000/")!
        let web_request = URLRequest(url: web_url)
        mWebView.load(web_request)
        
        // Do any additional setup after loading the view.
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
