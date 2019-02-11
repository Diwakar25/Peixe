//
//  Formatter.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/10/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import Foundation

class Formatter {
    
    public static func doubleMoneyToString(_ value: Double) -> String {
        
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        
        if let result = formatter.string(from: NSNumber(value: value)) {
            return result
        } else {
            return ""
        }
    }
}
