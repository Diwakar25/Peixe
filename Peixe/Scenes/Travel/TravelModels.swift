//
//  TravelModels.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/10/19.
//  Copyright (c) 2019 Gabriel vieira. All rights reserved.

import Foundation

struct TravelRequest: APIBaseRequest {
    
    var endpoint: String {
        return "/insidegui/d2665b556f2be1b1ad3a19d2ef9bcc44/raw/afe1e0a9563e3bcddc3796b22becb8f12f82ee2e/viagens.json"
    }
    
    var method: HTTPMethod {
        return .get
    }
}
