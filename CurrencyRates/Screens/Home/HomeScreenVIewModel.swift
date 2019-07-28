//
//  HomeScreenVIewModel.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 26/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

protocol HomeScreenViewModelType {
    var dataSource: HomeScreenDataSource! { get }
    func didTapAddCurrencies(with navController: UINavigationController)
}

final class HomeScreenViewModel: HomeScreenViewModelType {
    
    // MARK: - Dependencies
    
    var dataSource: HomeScreenDataSource!
    
    // MARK: - Init
    
    init(dataSource: HomeScreenDataSource) {
        self.dataSource = dataSource
        
    }
    
    // MARK: - Public methods
    
}

// MARK: - Extensions

extension HomeScreenViewModel {
    
    // Navigation
    func didTapAddCurrencies(with navController: UINavigationController) {
        let currencyPickerDataSource = CurrencyPickerDataSource()
        let currencyPickerViewModel = CurrencyPickerViewModel(dataSource: currencyPickerDataSource)
        let currencyPickerViewController = CurrencyPickerViewController(viewModel: currencyPickerViewModel)
        let presentedNavcontroller = UINavigationController(rootViewController: currencyPickerViewController)
        navController.present(presentedNavcontroller, animated: true, completion: nil)
    }
}

