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
    var timer: Timer?
    
    // MARK: - Init
    
    init(dataSource: HomeScreenDataSource, apiService: APIServiceType) {
        self.dataSource = dataSource
        self.apiService = apiService
        
        setupTimedRequestsForRates()
        setupCallbacks()
    }
    
    // MARK: - Public methods
    
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
    
    // MARK: - Private methods
    
    private func getCurrencyPairs(from dictionary: [String: Any]) -> [CurrencyPair] {
        var pairs = [CurrencyPair]()
        dictionary.forEach({ (key, value) in
            var currencyLettersArray = key.map { $0 }
            guard currencyLettersArray.count == 6 else { return }
            let mainCurrency = String(currencyLettersArray[0...2])
            let secondayCurrency = String(currencyLettersArray[3...5])
            if let value = value as? Double {
                let currencyPair = CurrencyPair(pair: key, mainCurrency: mainCurrency, secondaryCurrency: secondayCurrency, rate: value)
                pairs.append(currencyPair)
            }
        })
        let sortedPairs = pairs.sorted { dataSource.stringPairs.firstIndex(of: $0.pair)! < dataSource.stringPairs.firstIndex(of: $1.pair)! }
        return sortedPairs
    }
    
    private func setupTimedRequestsForRates() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(executeRequest), userInfo: nil, repeats: true)
    }
    
    private func endTimer() {
        timer?.invalidate()
    }
    
    private func setupCallbacks() {
        dataSource.shouldStopFetchingData = { [weak self] in
            self?.endTimer()
        }
        dataSource.shouldContinueFetchingData = { [weak self] in
            self?.setupTimedRequestsForRates()
        }
    }
    
    // Handlers 
    
    @objc private func executeRequest() {
        guard let pairs = dataSource?.stringPairs, !pairs.isEmpty else { return }
        getExchangeRates(for: pairs)
    }
}

// MARK: - Extensions

extension HomeScreenViewModel {
    
    func didTapAddCurrencies(with navController: UINavigationController) {
        let currencyPickerDataSource = CurrencyPickerDataSource(currencyPairsDisplayedOnHomeScreen: dataSource.currencyPairs)
        let currencyPickerViewModel = CurrencyPickerViewModel(dataSource: currencyPickerDataSource)
        let currencyPickerViewController = CurrencyPickerViewController(viewModel: currencyPickerViewModel)
        currencyPickerViewModel.didDismissWithCurrencies = { [weak self] currencies in
            self?.dataSource.stringPairs.append("\(currencies[0])\(currencies[1])")
            if let pairs = self?.dataSource.stringPairs {
                self?.getExchangeRates(for: pairs)
            }
        }
        let presentedNavcontroller = UINavigationController(rootViewController: currencyPickerViewController)
        navController.present(presentedNavcontroller, animated: true, completion: nil)
    }
}

