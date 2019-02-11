//
//  BaseViewController.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/10/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    let loader: LoaderView = LoaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ColorConstants.white
    }
    
    public func startLoader() {
        self.loader.startLoader(view: self.view)
    }
    
    public func stopLoader() {
        self.loader.stopLoader()
    }
}
