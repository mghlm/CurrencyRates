//
//  HomeScreenDataSource.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 26/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation
import UIKit

class HomeScreenDataSource: NSObject {
    
    // MARK: - Public properties
    
    var didUpdateData: (() -> Void)?
    var shouldStopFetchingRates: (() -> Void)?
    var shouldContinueFetchingRates: (() -> Void)?
    
    var currencyPairs = [CurrencyPair]()
    var stringPairs = [String]()
}

// MARK: - Extensions 

extension HomeScreenDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyPairs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyPairTableViewCell.id, for: indexPath) as! CurrencyPairTableViewCell
        let currencyPair = currencyPairs[indexPath.row]
        cell.selectionStyle = .none
        cell.accessibilityIdentifier = "currencyPairTableViewCellIdentifier"
        cell.configure(with: currencyPair)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        shouldStopFetchingRates?()
    }
    
//    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
//        shouldContinueFetchingRates?()
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            currencyPairs.remove(at: indexPath.row)
            stringPairs.remove(at: indexPath.row)
            shouldContinueFetchingRates?()
            didUpdateData?()
        }
    }
}
