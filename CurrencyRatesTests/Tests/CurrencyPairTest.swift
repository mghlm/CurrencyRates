//
//  CurrencyPairTest.swift
//  CurrencyRatesTests
//
//  Created by Magnus Holm on 31/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest
@testable import CurrencyRates

class CurrencyPairTest: XCTestCase {
    
    var mainCurrency: Currency!
    var secondaryCurrency: Currency!
    var pair: CurrencyPair!

    override func setUp() {
        mainCurrency = .GBP
        secondaryCurrency = .EUR
        pair = CurrencyPair(pair: "GBPEUR", mainCurrency: mainCurrency, secondaryCurrency: secondaryCurrency, rate: 1.2345)
    }
    
    func testSecondaryCurrencyExist() {
        XCTAssertNotNil(pair.pair)
        XCTAssertEqual(pair.pair, "GBPEUR")
    }
    
    func testPairExist() {
        XCTAssertNotNil(pair.mainCurrency)
        XCTAssertEqual(pair.mainCurrency, .GBP)
    }
    
    func testMainCurrencyExist() {
        XCTAssertNotNil(pair.secondaryCurrency)
        XCTAssertEqual(pair.secondaryCurrency, .EUR)
    }
    
    func testRateExist() {
        XCTAssertNotNil(pair.rate)
        XCTAssertEqual(pair.rate, 1.2345)
    }

}
