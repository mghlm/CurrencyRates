//
//  CurrencyTest.swift
//  CurrencyRatesTests
//
//  Created by Magnus Holm on 31/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest
@testable import CurrencyRates

class CurrencyTest: XCTestCase {
    
    var currency: Currency!

    override func setUp() {
        currency = .EUR
    }

    func testCurrencyHasName() {
        XCTAssertNotNil(currency.name)
        XCTAssertEqual(currency.name, "Euro")
    }
    
    func testCurrencyHasAcronym() {
        XCTAssertNotNil(currency.acronym)
        XCTAssertEqual(currency.acronym, "EUR")
    }
    
    func testCurrencyHasFlag() {
        XCTAssertNotNil(currency.flag)
        XCTAssertEqual(currency.flag, "🇪🇺")
    }
}
