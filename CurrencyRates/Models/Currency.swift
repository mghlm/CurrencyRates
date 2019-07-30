//
//  Currency.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 26/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

enum Currency: String {
    case AUD, BGN, BRL, CAD, CHF, CNY, CZK, DKK, EUR, GBP, HKD,
        HRK, HUF, IDR, ILS, INR, ISK, JPY, KRW, MXN, MYR, NOK,
        NZD, PHP, PLN, RON, RUB, SEK, SGD, THB, TRY, USD, ZAR
    
    static let allValues = [AUD, BGN, BRL, CAD, CHF, CNY,
                            CZK, DKK, EUR, GBP, HKD, HRK, HUF, IDR,
                            ILS, INR, ISK, JPY, KRW, MXN, MYR,
                            NOK, NZD, PHP, PLN, RON, RUB, SEK,
                            SGD, THB, TRY, USD, ZAR]
    
    var name: String {
        switch self {
        case .EUR:
            return "Euro"
        case .AUD:
            return "Australian Dollar"
        case .BGN:
            return "Bulgarian Lev"
        case .BRL:
            return "Brazil Real"
        case .CAD:
            return "Canadian Dollar"
        case .CHF:
            return "Swiss Franc"
        case .CNY:
            return "Chinese Yuan"
        case .CZK:
            return "Czech Republic Koruna"
        case .DKK:
            return "Danish Krone"
        case .GBP:
            return "British Pound"
        case .HKD:
            return "Hong Kong Dollar"
        case .HRK:
            return "Croatian Kuna"
        case .HUF:
            return "Hungarian Forint"
        case .IDR:
            return "Indonesian Rupiah"
        case .ILS:
            return "Israeli Shekel"
        case .INR:
            return "Indian Rupee"
        case .ISK:
            return "Icelandic Krona"
        case .JPY:
            return "Japanese Yen"
        case .KRW:
            return "Korean Won"
        case .MXN:
            return "Mexican Peso"
        case .MYR:
            return "Malaysian Ringgit"
        case .NOK:
            return "Norwegian Krone"
        case .NZD:
            return "New Zealand Dollar"
        case .PHP:
            return "Philippine Peso"
        case .PLN:
            return "Polish Zloty"
        case .RON:
            return "Romanian Leu"
        case .RUB:
            return "Russian Ruble"
        case .SEK:
            return "Swedish Krona"
        case .SGD:
            return "Singaporean Dollar"
        case .THB:
            return "Thailand Baht"
        case .TRY:
            return "Turkish Lira"
        case .USD:
            return "United States Dollar"
        case .ZAR:
            return "South African Rand"
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
            return "GBP"
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
