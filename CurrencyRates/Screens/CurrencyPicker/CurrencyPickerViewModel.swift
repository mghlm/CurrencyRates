//
//  CurrencyPickerViewModel.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 27/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

protocol CurrencyPickerViewModelType {
    var dataSource: CurrencyPickerDataSource! { get }
    var currencies: [String] { get set }
    func didSelectCurrency(in navController: UINavigationController)
    var didDismissWithCurrencies: (([String]) -> ())? { get set }
}

final class CurrencyPickerViewModel: CurrencyPickerViewModelType {
    
    // MARK: - Public properties
    
    var currencies = [String]()
    var didDismissWithCurrencies: (([String]) -> ())?
    
    // MARK: - Dependencies
    
    var dataSource: CurrencyPickerDataSource!
    
    // MARK: - Init
    
    init(dataSource: CurrencyPickerDataSource) {
        self.dataSource = dataSource
    }
    
    // MARK: - Private methods
    
    func didSelectCurrency(in navController: UINavigationController) {
        if currencies.count < 2 {
            pushToCurrencyPickerScreen(in: navController, with: currencies)
        } else {
            dismissToHomeScreen(in: navController, with: currencies)
        }
    }
}

extension CurrencyPickerViewModel {
    
    // Navigation 
    private func pushToCurrencyPickerScreen(in navController: UINavigationController, with currencies: [String]) {
        let currencyPickerDataSource = CurrencyPickerDataSource()
        let currencyPickerViewModel = CurrencyPickerViewModel(dataSource: currencyPickerDataSource)
        let currencyPickerViewController = CurrencyPickerViewController(viewModel: currencyPickerViewModel)
        currencyPickerViewModel.didDismissWithCurrencies = didDismissWithCurrencies
        currencyPickerViewModel.currencies = currencies
        navController.pushViewController(currencyPickerViewController, animated: true)
    }
    
    private func dismissToHomeScreen(in navController: UINavigationController, with currencies: [String]) {
        navController.dismiss(animated: true) {
            self.didDismissWithCurrencies?(currencies)
        }
    }
}
