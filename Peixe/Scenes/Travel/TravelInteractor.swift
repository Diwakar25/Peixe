//
//  TravelInteractor.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/10/19.
//  Copyright (c) 2019 Gabriel vieira. All rights reserved.

import UIKit

class TravelInteractor: DealBusinessLogic, DealDataStore {
    
    var presenter: DealPresentationLogic?
    var apiService: APIService = APIService()
    
    func fetchDeals() {
        
        let request = TravelRequest()
        self.apiService.request(request, decodingType: DealResponse.self) { (result) in
            
            switch result {
                
            case .success(let dealResponse):
                self.presenter?.presentDeals(result: dealResponse)
                
            case.failure(let error):
                self.presenter?.presentError(error: error)
            }
        }
    }
}
