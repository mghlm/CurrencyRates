//
//  CurrencyPair.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 26/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

struct CurrencyPair {
    var pair: String
    var mainCurrency: Currency
    var secondaryCurrency: Currency
    var rate: Double?
}
