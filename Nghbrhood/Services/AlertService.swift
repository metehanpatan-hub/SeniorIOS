//
//  AlertService.swift
//  Nghbrhood
//
//  Created by Metehan Patan on 17.04.2021.
//  Copyright © 2021 Nghbrhood. All rights reserved.
//

import UIKit

class AlertService {
    
    func alert(message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        return alert
    }
}
