//
//  CurrencyPickerDataSource.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 27/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import UIKit

final class CurrencyPickerDataSource: NSObject {
    
    // MARK: - Public propreties
    
    var selectedCurrency: Currency?
    var supportedCurrencies: [Currency]!
    var currencyPairsDisplayedOnHomeScreen: [CurrencyPair]!
    var didSelectCurrency: ((Currency) -> ())?
        
    // MARK: - Init
    
    init(supportedCurrencies: [Currency] = Currency.allValues, currencyPairsDisplayedOnHomeScreen: [CurrencyPair]) {
        self.supportedCurrencies = supportedCurrencies
        self.currencyPairsDisplayedOnHomeScreen = currencyPairsDisplayedOnHomeScreen
    }
    
    func cellShouldBeHighlighted(for currency: Currency) -> Bool {
        return currency.acronym == selectedCurrency?.acronym ||
            alreadySelectedSecondaryCurrencyPairs().contains(currency.acronym)
    }
    
    func alreadySelectedSecondaryCurrencyPairs() -> [String] {
        var alreadySelectedCurrencyPairs = [String]()
        guard let selectedCurrency = selectedCurrency, let currencyPairsDisplayedOnHomeScreen = currencyPairsDisplayedOnHomeScreen else { return alreadySelectedCurrencyPairs }
        currencyPairsDisplayedOnHomeScreen.forEach { (pair) in
            if selectedCurrency.acronym == pair.mainCurrency {
                alreadySelectedCurrencyPairs.append(pair.secondaryCurrency)
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currency = supportedCurrencies[indexPath.row]
        cell.textLabel?.text = currency.acronym
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let currency = supportedCurrencies[indexPath.row]
        if cellShouldBeHighlighted(for: currency) {
            cell.isUserInteractionEnabled = false
            cell.textLabel?.text = "not selectable"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCurrency = supportedCurrencies[indexPath.row]
        didSelectCurrency?(selectedCurrency)
    }
}
