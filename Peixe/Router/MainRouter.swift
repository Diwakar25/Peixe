//
//  Router.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/10/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import UIKit

class MainRouter {

    public static func createHomeTabController() -> UITabBarController {

        let tabController = BaseTabBarController()
        tabController.viewControllers = [ RouterBuilder.createCityScene(),
                                          RouterBuilder.createTravelScene(),
                                          RouterBuilder.createProductScene()]
        
        return tabController
    }
}
