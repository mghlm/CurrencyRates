//
//  CurrencyPickerViewModel.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 27/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

protocol CurrencyPickerViewModelType {
    
    /// DataSource for Currency Picker Screen
    var dataSource: CurrencyPickerDataSource! { get }
    
    /// The currency/currencies selected to compare rates between
    var selectedCurrencies: [Currency] { get set }
    
    /// Navigates to either another currency picker screen or dismisses back to homescreen
    ///
    /// - Parameter navController: The currently presented navigation controller
    func didSelectCurrency(in navController: UINavigationController)
    
    /// Callback that passes the selected currencies for comparison when picker screen is dismissed
    var didDismissWithCurrencies: (([Currency]) -> ())? { get set }
}

final class CurrencyPickerViewModel: CurrencyPickerViewModelType {
    
    // MARK: - Public properties
    
    var selectedCurrencies = [Currency]()
    var didDismissWithCurrencies: (([Currency]) -> ())?
    
    // MARK: - Dependencies
    
    var dataSource: CurrencyPickerDataSource!
    
    // MARK: - Init
    
    init(dataSource: CurrencyPickerDataSource) {
        self.dataSource = dataSource
    }
    
    // MARK: - Private methods
    
    func didSelectCurrency(in navController: UINavigationController) {
        if selectedCurrencies.count < 2 {
            pushToCurrencyPickerScreen(in: navController, with: selectedCurrencies)
        } else {
            dismissToHomeScreen(in: navController, with: selectedCurrencies)
        }
    }
}

extension CurrencyPickerViewModel {
    
    // Navgiation 
    
    private func pushToCurrencyPickerScreen(in navController: UINavigationController, with currencies: [Currency]) {
        // DataSource
        let currencyPickerDataSource = CurrencyPickerDataSource(currencyPairsDisplayedOnHomeScreen: dataSource.currencyPairsDisplayedOnHomeScreen)
        currencyPickerDataSource.selectedCurrency = currencies[0]
        
        // ViewModel
        let currencyPickerViewModel = CurrencyPickerViewModel(dataSource: currencyPickerDataSource)
        currencyPickerViewModel.didDismissWithCurrencies = didDismissWithCurrencies
        currencyPickerViewModel.selectedCurrencies = selectedCurrencies
        
        // ViewController
        let currencyPickerViewController = CurrencyPickerViewController(viewModel: currencyPickerViewModel)
        
        navController.pushViewController(currencyPickerViewController, animated: true)
    }
    
    private func dismissToHomeScreen(in navController: UINavigationController, with selectedCurrencies: [Currency]) {
        navController.dismiss(animated: true) {
            self.didDismissWithCurrencies?(selectedCurrencies)
        }
    }
}
