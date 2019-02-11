//
//  BaseRequest.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/9/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import Foundation

protocol APIBaseRequest {
    
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var parameters: [String : Any] { get }
    var headers: [String : String] { get }
}

//default values for header and body is empty
extension APIBaseRequest {
    
    var headers: [String : String] {
        return [:]
    }
    
    var parameters: [String : Any] {
        return [:]
    }
}
