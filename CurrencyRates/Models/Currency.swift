//
//  Currency.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 26/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation
//
//enum Currency: String, Decodable {
//    case EUR, AUD, BGN, BRL, CAD, CHF, CNY, CZK, DKK, GBP, HKD, HRK,
//    HUF, IDR, ILS, INR, ISK, JPY, KRW, MXN, MYR, NOK, NZD, PHP,
//    PLN, RON, RUB, SEK, SGD, THB, TRY, USD, ZAR
//
//    var name: String {
//        switch self {
//
//        case .EUR:
//            return "Euro"
//        case .AUD:
//            return "Australia Dollar"
//        case .BGN:
//            return "Bulgaria Lev"
//        case .BRL:
//            return "Brazil Real"
//        case .CAD:
//            return "Canada Dollar"
//        case .CHF:
//            return "Switzerland Franc"
//        case .CNY:
//            return "China Yuan Renminbi"
//        case .CZK:
//            return "Czech Republic Koruna"
//        case .DKK:
//            return "Denmark Krone"
//        case .GBP:
//            return "United Kingdom Pound"
//        case .HKD:
//            return "Hong Kong Dollar"
//        case .HRK:
//            return "Croatia Kuna"
//        case .HUF:
//            return "Hungary Forint"
//        case .IDR:
//            return "Indonesia Rupiah"
//        case .ILS:
//            return "Israel Shekel"
//        case .INR:
//            return "India Rupee"
//        case .ISK:
//            return "Iceland Krona"
//        case .JPY:
//            return "Japan Yen"
//        case .KRW:
//            return "Korea (South) Won"
//        case .MXN:
//            return "Mexico Peso"
//        case .MYR:
//            return "Malaysian Ringgit"
//        case .NOK:
//            return "Norway Krone"
//        case .NZD:
//            return "New Zealand Dollar"
//        case .PHP:
//            return "Philippines Peso"
//        case .PLN:
//            return "Poland Zloty"
//        case .RON:
//            return "Romania Leu"
//        case .RUB:
//            return "Russia Ruble"
//        case .SEK:
//            return "Sweden Krona"
//        case .SGD:
//            return "Singapore Dollar"
//        case .THB:
//            return "Thailand Baht"
//        case .TRY:
//            return "Turkey Lira"
//        case .USD:
//            return "United States Dollar"
//        case .ZAR:
//            return "South Africa Rand"
//        }
//    }
//}
//
//extension Currency: CaseIterable {
//    static func allCurrencies() -> [Currency] {
//        return Currency.allCases
//    }
//}
//
//extension Currency: Hashable {}

struct Currency: Decodable {
    var name: String
    var acronym: String
}

struct AllCurrencies {
    var currencies = ["AUD", "BGN", "BRL", "CAD", "CHF", "CNY", "CZK", "DKK", "EUR", "GBP", "HKD", "HRK", "HUF", "IDR", "ILS", "INR", "ISK", "JPY", "KRW", "MXN", "MYR", "NOK", "NZD", "PHP", "PLN", "RON", "RUB", "SEK", "SGD", "THB", "USD", "ZAR" ]

    var allCurrencies = [Currency]()

    init() {
        allCurrencies = currencies.map { Currency(name: "", acronym: $0) }
    }
}

extension Currency: Hashable {}
