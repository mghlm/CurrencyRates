//
//  RatesResponseTest.swift
//  CurrencyRatesTests
//
//  Created by Magnus Holm on 31/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest

class RatesResponseTest: XCTestCase {
    
    var reader: DataReader!

    override func setUp() {
        reader = DataReader()
    }
    
    func testRateResponseHasCorrectData() {
        let data = try! reader.readFile(named: "currency_pairs", ofType: "json")
        guard let response = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Double] else { return }
        
        XCTAssertEqual(response["DKKGBP"], 0.1194)
        XCTAssertEqual(response["GBPUSD"], 1.3039)
        XCTAssertEqual(response["USDGBP"], 0.7861)
    }
}
