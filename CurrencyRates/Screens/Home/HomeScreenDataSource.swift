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
    
    /// To call when data gets updated to reload tableview
    var didUpdateData: (() -> Void)?
    
    /// Pauses the requests for rates
    var shouldStopFetchingRates: (() -> Void)?
    
    /// Continue the requests for rates
    var shouldContinueFetchingRates: (() -> Void)?
    
    /// Currency pairs currently showed on home screen
    var currencyPairs = [CurrencyPair]()
    
    /// Currency pairs currently showed on home screen in string format ie. ["GBPEUR", "EURGBP"]
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            currencyPairs.remove(at: indexPath.row)
            stringPairs.remove(at: indexPath.row)
            shouldContinueFetchingRates?()
            didUpdateData?()
        }
    }
}
