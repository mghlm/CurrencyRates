//
//  Currency.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 26/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

enum Currency: String {
    case EUR, AUD, BGN, BRL, CAD, CHF, CNY, CZK, DKK, GBP, HKD,
        HRK, HUF, IDR, ILS, INR, ISK, JPY, KRW, MXN, MYR, NOK,
        NZD, PHP, PLN, RON, RUB, SEK, SGD, THB, TRY, USD, ZAR
    
    static let allValues = [EUR, AUD, BGN, BRL, CAD, CHF, CNY,
                            CZK, DKK, GBP, HKD, HRK, HUF, IDR,
                            ILS, INR, ISK, JPY, KRW, MXN, MYR,
                            NOK, NZD, PHP, PLN, RON, RUB, SEK,
                            SGD, THB, TRY, USD, ZAR]
    
    var name: String {
        switch self {
        case .EUR:
            return "Euro"
        case .AUD:
            return "Australia Dollar"
        case .BGN:
            return "Bulgaria Lev"
        case .BRL:
            return "Brazil Real"
        case .CAD:
            return "Canada Dollar"
        case .CHF:
            return "Switzerland Franc"
        case .CNY:
            return "China Yuan Renminbi"
        case .CZK:
            return "Czech Republic Koruna"
        case .DKK:
            return "Denmark Krone"
        case .GBP:
            return "United Kingdom Pound"
        case .HKD:
            return "Hong Kong Dollar"
        case .HRK:
            return "Croatia Kuna"
        case .HUF:
            return "Hungary Forint"
        case .IDR:
            return "Indonesia Rupiah"
        case .ILS:
            return "Israel Shekel"
        case .INR:
            return "India Rupee"
        case .ISK:
            return "Iceland Krona"
        case .JPY:
            return "Japan Yen"
        case .KRW:
            return "Korea (South) Won"
        case .MXN:
            return "Mexico Peso"
        case .MYR:
            return "Malaysian Ringgit"
        case .NOK:
            return "Norway Krone"
        case .NZD:
            return "New Zealand Dollar"
        case .PHP:
            return "Philippines Peso"
        case .PLN:
            return "Poland Zloty"
        case .RON:
            return "Romania Leu"
        case .RUB:
            return "Russia Ruble"
        case .SEK:
            return "Sweden Krona"
        case .SGD:
            return "Singapore Dollar"
        case .THB:
            return "Thailand Baht"
        case .TRY:
            return "Turkey Lira"
        case .USD:
            return "United States Dollar"
        case .ZAR:
            return "South Africa Rand"
        }
    }
    
    var acronym: String {
        switch self {
        case .EUR:
            return "EUR"
        case .AUD:
            return "AUD"
        case .BGN:
            return "BGN"
        case .BRL:
            return "BRL"
        case .CAD:
            return "CAD"
        case .CHF:
            return "CHF"
        case .CNY:
            return "CNY"
        case .CZK:
            return "CZK"
        case .DKK:
            return "DKK"
        case .GBP:
            return "UGBP"
        case .HKD:
            return "HKD"
        case .HRK:
            return "HRK"
        case .HUF:
            return "HUF"
        case .IDR:
            return "IDR"
        case .ILS:
            return "ILS"
        case .INR:
            return "INR"
        case .ISK:
            return "ISK"
        case .JPY:
            return "JPY"
        case .KRW:
            return "KRW"
        case .MXN:
            return "MXN"
        case .MYR:
            return "MYR"
        case .NOK:
            return "NOK"
        case .NZD:
            return "NZD"
        case .PHP:
            return "PHP"
        case .PLN:
            return "PLN"
        case .RON:
            return "RON"
        case .RUB:
            return "RUB"
        case .SEK:
            return "SEK"
        case .SGD:
            return "SGD"
        case .THB:
            return "THB"
        case .TRY:
            return "TRY"
        case .USD:
            return "USD"
        case .ZAR:
            return "ZAR"
        }
    }
    
    var flag: String {
        switch self {
        case .EUR:
            return "🇪🇺"
        case .AUD:
            return "🇦🇺"
        case .BGN:
            return "🇧🇬"
        case .BRL:
            return "🇧🇷"
        case .CAD:
            return "🇨🇦"
        case .CHF:
            return "🇨🇭"
        case .CNY:
            return "🇨🇳"
        case .CZK:
            return "🇨🇿"
        case .DKK:
            return "🇩🇰"
        case .GBP:
            return "🇬🇧"
        case .HKD:
            return "🇭🇰"
        case .HRK:
            return "🇭🇷"
        case .HUF:
            return "🇭🇺"
        case .IDR:
            return "🇮🇩"
        case .ILS:
            return "🇮🇱"
        case .INR:
            return "🇮🇳"
        case .ISK:
            return "🇮🇸"
        case .JPY:
            return "🇯🇵"
        case .KRW:
            return "🇰🇷"
        case .MXN:
            return "🇲🇽"
        case .MYR:
            return "🇲🇾"
        case .NOK:
            return "🇳🇴"
        case .NZD:
            return "🇳🇿"
        case .PHP:
            return "🇵🇭"
        case .PLN:
            return "🇵🇱"
        case .RON:
            return "🇷🇴"
        case .RUB:
            return "🇷🇺"
        case .SEK:
            return "🇸🇪"
        case .SGD:
            return "🇸🇬"
        case .THB:
            return "🇹🇭"
        case .TRY:
            return "🇹🇷"
        case .USD:
            return "🇺🇸"
        case .ZAR:
            return "🇿🇦"
        }
    }
}
