//
//  RouterBuilder.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/10/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import UIKit

class RouterBuilder {
    
    public static func createProductScene() -> UIViewController {
        
        let controller = DealViewController()
        let localizedTitle = NSLocalizedString("product", comment: "")
        
        controller.tabBarItem = UITabBarItem.init(title: localizedTitle, image: UIImage(named: ImageConstants.productIcon), tag: 0)
        controller.title = localizedTitle
        
        let interactor = ProductInteractor()
        let presenter = DealPresenter()
        controller.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = controller
        
        return BaseNavigationController(rootViewController: controller)
    }
    
    public static func createTravelScene() -> UIViewController {
        
        let controller = DealViewController()
        let localizedTitle = NSLocalizedString("travel", comment: "")
        
        controller.tabBarItem = UITabBarItem.init(title: localizedTitle, image: UIImage(named: ImageConstants.travelIcon), tag: 1)
        controller.title = localizedTitle
        
        let interactor = TravelInteractor()
        let presenter = DealPresenter()
        controller.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = controller
        
        return BaseNavigationController(rootViewController: controller)
    }
    
    public static func createCityScene() -> UIViewController {
        
        let controller = DealViewController()
        let localizedTitle = NSLocalizedString("on_city", comment: "")
        
        controller.tabBarItem = UITabBarItem.init(title: localizedTitle, image: UIImage(named: ImageConstants.cityIcon), tag: 2)
        controller.title = localizedTitle
        
        let interactor = CityInteractor()
        let presenter = DealPresenter()
        controller.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = controller
        
        return BaseNavigationController(rootViewController: controller)
    }
}
