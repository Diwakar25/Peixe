//
//  Alert.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/11/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import UIKit

class Alert {
    
    public static func createError(_ message: String) -> UIAlertController {
        
        let alert = UIAlertController(title: NSLocalizedString("alert", comment: ""), message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        return alert
    }
}
