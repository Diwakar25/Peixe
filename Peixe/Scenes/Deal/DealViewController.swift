//
//  HomeViewController.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/9/19.
//  Copyright (c) 2019 Gabriel vieira. All rights reserved.

import UIKit

class DealViewController: BaseViewController, DealDisplayLogic {
    
    var interactor: DealBusinessLogic?
    var tableView: UITableView = UITableView()
    var viewModel: DealViewModel?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: View lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.configUI()
        self.fetchDeals()
    }
    
    private func configUI() {
    
        //tableView
        self.view.addSubview(self.tableView)
        self.tableView.backgroundColor = ColorConstants.blue
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.isHidden = true
        self.tableView.register(UINib(nibName: DealTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: DealTableViewCell.reuseIdentifier)
        
        self.view.addConstraints([
            NSLayoutConstraint(item: self.tableView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.tableView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.tableView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: self.tableView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0),
            ])
        
        self.tableView.reloadData()
    }

    private func fetchDeals() {
        self.startLoader()
        self.interactor?.fetchDeals()
    }
    
    func displayDeals(viewModel: DealViewModel) {
        
        self.viewModel = viewModel
        DispatchQueue.main.async {
            
            self.stopLoader()
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func displayError(message: String) {
        
        DispatchQueue.main.async {
            
            self.stopLoader()
            let alert = Alert.createError(message)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension DealViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let items = self.viewModel?.deals else { return 0 }
        return items.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 295
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let viewModels = self.viewModel?.deals else { return UITableViewCell() }
        
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: DealTableViewCell.reuseIdentifier,
                                          for: indexPath) as? DealTableViewCell else { return UITableViewCell() }
        let viewModel = viewModels[indexPath.row]
        cell.setup(viewModel)
        return cell
    }
}
