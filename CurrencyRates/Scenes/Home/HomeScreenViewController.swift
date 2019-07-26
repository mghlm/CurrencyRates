//
// HomeScreenVIewController.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 26/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    // MARK: - Dependencies
    
    private var viewModel: HomeScreenViewModelType!
    
    // MARK: - Private properties
    
    lazy private var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = viewModel.dataSource
        tv.delegate = viewModel.dataSource
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()
    
    // MARK: - Init
    
    init(viewModel: HomeScreenViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    // MARK: - Private methods
    
    private func setupUI() {
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
    }

}

