//
//  Endpoint.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 27/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

enum Endpoint {
    
    case getCurrencyPairs(currencyPairs: [String])
    
    var scheme: String {
        switch self {
        case .getCurrencyPairs:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getCurrencyPairs:
            return "europe-west1-revolut-230009.cloudfunctions.net"
        }
    }
    
    var path: String {
        switch self {
        case .getCurrencyPairs:
            return "/revolut-ios"
        }
    }
    
    var method: String {
        switch self {
        case .getCurrencyPairs:
            return "GET"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getCurrencyPairs(let pairs):
            return pairs.map { URLQueryItem(name: "pairs", value: $0) }
        }
    }
}
