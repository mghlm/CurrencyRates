//
//  HomeScreenVIewModel.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 26/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

protocol HomeScreenViewModelType {
    
    /// Data source for home screen
    var dataSource: HomeScreenDataSource! { get }
    
    /// Callback in case of error, passes the NetworkError  
    var errorMessage: ((NetworkError) -> Void)? { get set }
    
    /// Presents currency picker screen
    ///
    /// - Parameter navController: Current navigation controller to present screen in
    func didTapAddCurrencies(with navController: UINavigationController)
    
    /// Fetches current exchange rates
    ///
    /// - Parameter currencies: Currency pairs to compare rates between ie. ["GBPEUR", "EURGBP"]
    func getExchangeRates(for currencies: [String], completion: @escaping (() -> Void))
}

final class HomeScreenViewModel: HomeScreenViewModelType {
    
    // MARK: - Dependencies
    
    private var apiService: APIServiceType!
    var dataSource: HomeScreenDataSource!
    
    // MARK: - Public properties
    
    var errorMessage: ((NetworkError) -> Void)?
    
    // MARK: - Private properties
    
    private weak var timer: Timer!
    
    // MARK: - Init
    
    init(dataSource: HomeScreenDataSource, apiService: APIServiceType) {
        self.dataSource = dataSource
        self.apiService = apiService
        
        setupCallbacks()
        setupTimedRequestsForRates()
    }
    
    deinit {
        endTimer()
    }
    
    // MARK: - Public methods
    
    func getExchangeRates(for currencies: [String], completion: @escaping (() -> Void)) {
        apiService.request(endpoint: .getCurrencyPairs(currencyPairs: currencies)) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let currencyRates):
                self.dataSource.currencyPairs = self.getSortedCurrencyPairs(from: currencyRates)
                completion()
//                self.dataSource.didLoadInitialData?()
            case .failure(let error):
                self.errorMessage?(error)
            }
        }
    }
    
    // MARK: - Private methods
    
    private func getSortedCurrencyPairs(from dictionary: [String: Any]) -> [CurrencyPair] {
        var pairs = [CurrencyPair]()
        dictionary.forEach({ (key, value) in
            var currencyLettersArray = key.map { $0 }
            guard currencyLettersArray.count == 6 else { return }
            let mainCurrency = String(currencyLettersArray[0...2])
            let secondayCurrency = String(currencyLettersArray[3...5])
            if let value = value as? Double, let mainCurrency = Currency(rawValue: mainCurrency), let secondaryCurrency = Currency(rawValue: secondayCurrency) {
                let currencyPair = CurrencyPair(pair: key, mainCurrency: mainCurrency, secondaryCurrency: secondaryCurrency, rate: value)
                pairs.append(currencyPair)
            }
        })
        let sortedPairs = pairs.sorted { dataSource.stringPairs.firstIndex(of: $0.pair)! < dataSource.stringPairs.firstIndex(of: $1.pair)! }
        return sortedPairs
    }
    
    private func setupTimedRequestsForRates() {
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(executeRequest), userInfo: nil, repeats: true)
    }
    
    private func endTimer() {
        guard timer != nil else { return }
        timer?.invalidate()
        timer = nil
    }
    
    private func setupCallbacks() {
        dataSource.shouldStopFetchingRates = { [weak self] in
            self?.endTimer()
        }
        dataSource.shouldContinueFetchingRates = { [weak self] in
            self?.setupTimedRequestsForRates()
        }
    }
    
    // Handlers 
    
    @objc private func executeRequest() {
        guard let pairs = dataSource?.stringPairs, !pairs.isEmpty else { return }
//        getExchangeRates(for: pairs)
    }
}

// MARK: - Extensions

extension HomeScreenViewModel {
    
    // Navigation
    
    func didTapAddCurrencies(with navController: UINavigationController) {
        // DataSource
        let currencyPickerDataSource = CurrencyPickerDataSource(currencyPairsDisplayedOnHomeScreen: dataSource.currencyPairs)
        
        // ViewModel
        let currencyPickerViewModel = CurrencyPickerViewModel(dataSource: currencyPickerDataSource)
        currencyPickerViewModel.didDismissWithCurrencies = { [weak self] currencies in
            guard let self = self else { return }
            self.dataSource.stringPairs.append("\(currencies[0])\(currencies[1])")
            self.getExchangeRates(for: self.dataSource.stringPairs, completion: {
                self.dataSource.didUpdateData?()
            })
        }
        
        // ViewController
        let currencyPickerViewController = CurrencyPickerViewController(viewModel: currencyPickerViewModel)
        let presentedNavcontroller = UINavigationController(rootViewController: currencyPickerViewController)
        
        navController.present(presentedNavcontroller, animated: true, completion: nil)
    }
}

