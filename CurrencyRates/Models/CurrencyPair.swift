//
//  CurrencyPair.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 26/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

struct CurrencyPair: Decodable {
    var mainCurrency: String
    var secondaryCurrency: String
    var rate: Double?
}
