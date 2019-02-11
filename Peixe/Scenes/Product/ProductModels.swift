//
//  ProductModels.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/10/19.
//  Copyright (c) 2019 Gabriel vieira. All rights reserved.

import Foundation

struct ProductRequest: APIBaseRequest {
    
    var endpoint: String {
        return "/insidegui/007fd6664650391dca199e6784d1f351/raw/862d701c69307f9e9053f8cb1ec438586fca4b64/produtos.json"
    }
    
    var method: HTTPMethod {
        return .get
    }
}
