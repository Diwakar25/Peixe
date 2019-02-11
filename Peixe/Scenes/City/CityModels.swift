//
//  CityModels.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/10/19.
//  Copyright (c) 2019 Gabriel vieira. All rights reserved.


import Foundation

struct CityRequest: APIBaseRequest {
    
    var endpoint: String {
        return "/insidegui/2b1f747ebeb9070e33818bf857e28a84/raw/5da63767fda2ec16f4ae0718e3be4be75001fe10/florianopolis.json"
    }
    
    var method: HTTPMethod {
        return .get
    }
}

