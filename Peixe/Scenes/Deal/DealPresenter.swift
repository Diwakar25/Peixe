//
//  DealPresenter.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/11/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import Foundation

class DealPresenter: DealPresentationLogic {
    
    weak var viewController: DealDisplayLogic?
    
    func presentDeals(result: DealResponse) {
        
        let deals = result.response.deals.map {
            self.createDealViewModel(deal: $0)
        }
        
        let viewModel = DealViewModel.init(deals: deals, banners: [])
        self.viewController?.displayDeals(viewModel: viewModel)
    }
    
    func presentError(error: APIServiceError) {
        self.viewController?.displayError(message: NSLocalizedString("error_fetch_data", comment: ""))
    }
    
    private func createDealViewModel(deal: Deal) -> DealItemViewModel {
        
        let fullPrice = Formatter.doubleMoneyToString(deal.fullPrice)
        let salePrice = Formatter.doubleMoneyToString(deal.salePrice)
        let imageUrl = URL(string: deal.dealImage)
        
        let viewModel = DealItemViewModel.init(imageUrl: imageUrl, partnerName: deal.partner.name, dealName: deal.shortTitle, fullPrice: fullPrice, salePrice: salePrice, dealID: deal.dealID)
        
        return viewModel
    }
}
