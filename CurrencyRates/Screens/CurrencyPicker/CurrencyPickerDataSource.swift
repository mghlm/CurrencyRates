//
//  CurrencyPickerDataSource.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 27/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

final class CurrencyPickerDataSource: NSObject {
    
    // MARK: - Private properties
    
    /// All currencies to show on currency picker screen
    private var supportedCurrencies: [Currency]!
    
    // MARK: - Public propreties
    
    /// All currency pairs currently displayed on the home screen
    var currencyPairsDisplayedOnHomeScreen: [CurrencyPair]!
    
    /// The currency selected on previous currency picker screen
    var selectedCurrency: Currency?
    
    /// Callback passes the selected currency
    var didSelectCurrency: ((Currency) -> ())?
        
    // MARK: - Init
    
    init(supportedCurrencies: [Currency] = Currency.allValues, currencyPairsDisplayedOnHomeScreen: [CurrencyPair]) {
        self.supportedCurrencies = supportedCurrencies
        self.currencyPairsDisplayedOnHomeScreen = currencyPairsDisplayedOnHomeScreen
    }
    
    // MARK: - Private methods
    
    private func cellShouldBeHighlighted(for currency: Currency) -> Bool {
        return currency.acronym == selectedCurrency?.acronym ||
            alreadySelectedSecondaryCurrencyPairs().contains(currency.acronym)
    }
    
    private func alreadySelectedSecondaryCurrencyPairs() -> [String] {
        var alreadySelectedCurrencyPairs = [String]()
        guard let selectedCurrency = selectedCurrency, let currencyPairsDisplayedOnHomeScreen = currencyPairsDisplayedOnHomeScreen else { return alreadySelectedCurrencyPairs }
        currencyPairsDisplayedOnHomeScreen.forEach { (pair) in
            if selectedCurrency.acronym == pair.mainCurrency.acronym {
                alreadySelectedCurrencyPairs.append(pair.secondaryCurrency.acronym)
            }
        }
        return alreadySelectedCurrencyPairs
    }
}

// MARK: - Extensions

extension CurrencyPickerDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supportedCurrencies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyPickerTableViewCell.id, for: indexPath) as! CurrencyPickerTableViewCell
        let currency = supportedCurrencies[indexPath.row]
        cell.accessibilityIdentifier = "currencyPickerTableViewCellIdentifier"
        cell.shouldBeHighlighted = false
        cell.configure(with: currency)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let currency = supportedCurrencies[indexPath.row]
        let cell = cell as! CurrencyPickerTableViewCell
        if cellShouldBeHighlighted(for: currency) {
            cell.isUserInteractionEnabled = false
            cell.shouldBeHighlighted = true 
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCurrency = supportedCurrencies[indexPath.row]
        didSelectCurrency?(selectedCurrency)
    }
}
