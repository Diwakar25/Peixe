//
//  ServiceError.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/10/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import Foundation

enum APIServiceError: Error {
    
    case badUrl
    case authenticationRequired
    case brokenData
    case couldNotFindHost
    case couldNotParseObject
    case badRequest
    case unknown(String)
    
    var localizedDescription: String {
        
        switch self {
            
            case .badUrl: return "Bad URL request"
            case .authenticationRequired: return "Authentication is required."
            case .brokenData: return "The received data is broken."
            case .couldNotFindHost: return "The host was not found."
            case .badRequest: return "This is a bad request."
            case .couldNotParseObject: return "Can't convert the data to the object entity."
            case let .unknown(message): return message
        }
    }
}
