//
//  HTTPMethod.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/9/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    
    case options = "OPTIONS"
    case get = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case trace = "TRACE"
    case connect = "CONNECT"
}
