//
//  DealSceneProtocol.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/10/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import Foundation

protocol DealDisplayLogic: class {
    
    func displayDeals(viewModel: DealViewModel)
    func displayError(message: String)
}

protocol DealBusinessLogic {
    
    func fetchDeals()
}

protocol DealPresentationLogic {
    
    func presentDeals(result: DealResponse)
    func presentError(error: APIServiceError)
}

//protocol to inject properties on interactor
protocol DealDataStore {
    
}
