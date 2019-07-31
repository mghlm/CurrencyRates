//
//  CurrencyPickerViewController.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 27/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

class CurrencyPickerViewController: UIViewController {
    
    // MARK: - Dependencies
    
    private var viewModel: CurrencyPickerViewModelType!
    
    // MARK: - Private properties
    
    lazy private var tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.dataSource = viewModel.dataSource
        tv.delegate = viewModel.dataSource
        tv.register(CurrencyPickerTableViewCell.self, forCellReuseIdentifier: CurrencyPickerTableViewCell.id)
        tv.accessibilityIdentifier = "currencyPickerTableViewIdentifier"
        return tv
    }()
    
    // MARK: - Init
    
    init(viewModel: CurrencyPickerViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        navigationItem.title = "Currencies"
        navigationItem.setHidesBackButton(true, animated: false)
        view.backgroundColor = .white 
        view.addSubview(tableView)
        setupCallbacks()
        
        setupConstraints()
    }
    
    private func setupCallbacks() {
        viewModel.dataSource.didSelectCurrency = { [weak self] currency in
            guard let navController = self?.navigationController else { return }
            self?.viewModel.selectedCurrencies.append(currency)
            self?.viewModel.didSelectCurrency(in: navController)
        }
    }
    
    private func setupConstraints() {
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
}
