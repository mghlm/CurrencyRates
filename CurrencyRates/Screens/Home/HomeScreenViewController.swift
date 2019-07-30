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
    
    lazy private var addCurrencyHeaderView: AddCurrencyPairHeaderView = {
        let hv = AddCurrencyPairHeaderView(frame: .zero)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapAddCurrencies))
        hv.addGestureRecognizer(gestureRecognizer)
        hv.isHidden = addCurrencyPairView.isHidden ? false : true
        return hv
    }()
    
    lazy private var tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.separatorStyle = .none 
        tv.dataSource = viewModel.dataSource
        tv.delegate = viewModel.dataSource
        tv.register(CurrencyPairTableViewCell.self, forCellReuseIdentifier: CurrencyPairTableViewCell.id)
        return tv
    }()
    
//    lazy private var addNewCurrencyPairButton: UIButton = {
//        let btn = UIButton()
//        btn.setImage(UIImage(named: "Plus"), for: .normal)
//        btn.addTarget(self, action: #selector(didTapAddCurrencies), for: .touchUpInside)
//        btn.isHidden = true
//
//        return btn
//    }()
    
    lazy private var addCurrencyPairView: AddCurrencyPairView = {
        let v = AddCurrencyPairView(frame: .zero)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapAddCurrencies))
        v.addGestureRecognizer(gestureRecognizer)
        return v
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
        [addCurrencyHeaderView, tableView, addCurrencyPairView].forEach { view.addSubview($0) }
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
                self.addCurrencyPairView.isHidden = !self.viewModel.dataSource.stringPairs.isEmpty
                self.addCurrencyHeaderView.isHidden = self.viewModel.dataSource.stringPairs.isEmpty
            }
        }
    }
    
    private func setupConstraints() {
        addCurrencyHeaderView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: UIScreen.main.bounds.width, height: 90)
        tableView.anchor(top: addCurrencyHeaderView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addCurrencyPairView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 0)
        addCurrencyPairView.anchor(centerX: view.centerXAnchor, centerY: view.centerYAnchor)
    }
    
    // Handlers
    
    @objc private func didTapAddCurrencies() {
        guard let navController = navigationController else { return }
        viewModel.didTapAddCurrencies(with: navController)
    }
}

