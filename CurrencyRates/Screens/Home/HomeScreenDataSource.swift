//
//  HomeScreenDataSource.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 26/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation
import UIKit

final class HomeScreenDataSource: NSObject {
    
    // MARK: - Public properties
    
    var didUpdateData: (() -> Void)?
    var shouldStopFetchingData: (() -> Void)?
    var shouldContinueFetchingData: (() -> Void)?
    
    var currencyPairs = [CurrencyPair]()
    var stringPairs = [String]()
}

extension HomeScreenDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyPairs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currencyPair = currencyPairs[indexPath.row]
        cell.textLabel?.text = "\(currencyPair.mainCurrency) --- \(currencyPair.secondaryCurrency) ------ \(currencyPair.rate!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        shouldStopFetchingData?()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            currencyPairs.remove(at: indexPath.row)
            stringPairs.remove(at: indexPath.row)
            shouldContinueFetchingData?()
            didUpdateData?()
        }
    }
    
}
