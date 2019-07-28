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
    
    var supportedCurrencies: [Currency]!
    
    var didSelectCurrency: ((String) -> ())?
        
    // MARK: - Init
    
    init(supportedCurrencies: [Currency] = AllCurrencies().allCurrencies) {
        self.supportedCurrencies = supportedCurrencies
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCurrency = supportedCurrencies[indexPath.row].acronym
        didSelectCurrency?(selectedCurrency)
    }
}
