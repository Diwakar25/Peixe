//
//  Loader.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/10/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import UIKit

class LoaderView: UIView {
    
    private var activityIndicator: UIActivityIndicatorView
    
    public init() {
        
        self.activityIndicator = UIActivityIndicatorView.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        self.activityIndicator.style = .gray
        super.init(frame: CGRect.zero)
        self.addSubview(self.activityIndicator)
        self.backgroundColor = ColorConstants.backgroundLoader
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func startLoader(view: UIView) {
    
        DispatchQueue.main.async {
            self.frame = view.frame
            self.activityIndicator.center = CGPoint(x: self.center.x, y: self.center.y - 50)
            view.addSubview(self)
            self.activityIndicator.startAnimating()
        }
    }
    
    public func stopLoader() {
        
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.removeFromSuperview()
        }
    }
}
