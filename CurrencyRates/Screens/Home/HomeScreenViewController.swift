//
// HomeScreenVIewController.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 26/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

final class HomeScreenViewController: UIViewController {
    
    // MARK: - Dependencies
    
    private var viewModel: HomeScreenViewModelType!
    
    // MARK: - Private properties
    
    lazy private var tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.separatorStyle = .none 
        tv.dataSource = viewModel.dataSource
        tv.delegate = viewModel.dataSource
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()
    
    lazy private var addNewCurrencyPairButton: UIButton = {
        let btn = UIButton()
        
        return btn
    }() 
    
    lazy private var addCurrencyButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "Plus"), for: .normal)
        btn.addTarget(self, action: #selector(didTapAddCurrencies), for: .touchUpInside)
        return btn
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
        setupUI()
        setupCallBacks()
    }

    // MARK: - Private methods
    
    private func setupUI() {
        view.backgroundColor = .white
        setupNavbar()
        [tableView, addCurrencyButton].forEach { view.addSubview($0) }
        setupConstraints()
    }
    
    private func setupNavbar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Currency pairs"
    }
    
    private func setupCallBacks() {
        viewModel.dataSource.didUpdateData = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.addCurrencyButton.isHidden = !self.viewModel.dataSource.stringPairs.isEmpty
            }
        }
    }
    
    private func setupConstraints() {
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addCurrencyButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    // Handlers
    
    @objc private func didTapAddCurrencies() {
        guard let navController = navigationController else { return }
        viewModel.didTapAddCurrencies(with: navController)
    }

}

