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
    var apiService: APIServiceType!
    
    // MARK: - Init
    
    init(dataSource: HomeScreenDataSource, apiService: APIServiceType) {
        self.dataSource = dataSource
        self.apiService = apiService
        
        getExchangeRates(for: ["USDDKK", "GBPEUR", "GBPDKK"])
    }
    
    // MARK: - Public methods
    
    // MARK: - Private methods
    
    func getExchangeRates(for currencies: [String]) {
        apiService.request(endpoint: .getCurrencyPairs(currencyPairs: currencies)) { [weak self] (result) in
            switch result {
            case .success(let currencyRates):
                if let currencyPairs = self?.getCurrencyPairs(from: currencyRates) {
                    self?.dataSource.currencyPairs = currencyPairs
                    self?.dataSource.didUpdateData?()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getCurrencyPairs(from dictionary: [String: Any]) -> [CurrencyPair] {
        var pairs = [CurrencyPair]()
        dictionary.forEach({ (key, value) in
            var currencyLettersArray = key.map { $0 }
            let mainCurrency = String(currencyLettersArray[0...2])
            let secondayCurrency = String(currencyLettersArray[3...5])
            if let value = value as? Double {
                let currencyPair = CurrencyPair(mainCurrency: mainCurrency, secondaryCurrency: secondayCurrency, rate: value)
                pairs.append(currencyPair)
            }
        })
        return pairs
    }
    
    
}

// MARK: - Extensions

extension HomeScreenViewModel {
    
    // Navigation
    func didTapAddCurrencies(with navController: UINavigationController) {
        let currencyPickerDataSource = CurrencyPickerDataSource()
        let currencyPickerViewModel = CurrencyPickerViewModel(dataSource: currencyPickerDataSource)
        let currencyPickerViewController = CurrencyPickerViewController(viewModel: currencyPickerViewModel)
        currencyPickerViewModel.didDismissWithCurrencies = { [weak self] currencies in
            let currencyPair = CurrencyPair(mainCurrency: currencies[0], secondaryCurrency: currencies[1], rate: 1.2)
            self?.dataSource.currencyPairs.append(currencyPair)
            self?.dataSource.didUpdateData?()
        }
        let presentedNavcontroller = UINavigationController(rootViewController: currencyPickerViewController)
        navController.present(presentedNavcontroller, animated: true, completion: nil)
    }
}

