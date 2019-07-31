//
//  CurrencyPickerViewModelTest.swift
//  CurrencyRatesTests
//
//  Created by Magnus Holm on 31/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest
@testable import CurrencyRates

final class CurrencyPickerViewModelTest: XCTestCase {
    
    var dataSource: CurrencyPickerDataSource!
    var viewModel: CurrencyPickerViewModelType!
    
    var mockCurrencies = [Currency(rawValue: "USD")!, Currency(rawValue: "GBP")!]
    
    var mockPairs = [CurrencyPair(pair: "GBPUSD",
                                  mainCurrency: Currency(rawValue: "GBP")!,
                                  secondaryCurrency: Currency(rawValue: "USD")!,
                                  rate: nil),
                     CurrencyPair(pair: "USDGBP",
                                  mainCurrency: Currency(rawValue: "USD")!,
                                  secondaryCurrency: Currency(rawValue: "GBP")!,
                                  rate: nil)
    ]
    
    override func setUp() {
        dataSource = CurrencyPickerDataSource(currencyPairsDisplayedOnHomeScreen: mockPairs)
        viewModel = CurrencyPickerViewModel(dataSource: dataSource)
        viewModel.selectedCurrencies = mockCurrencies
    }
    
    func testDataSourceSetupCorrectly() {
        XCTAssertNotNil(viewModel.dataSource)
    }
    
    func testDidDismissCallbackNotSetupUponInstantiation() {
        XCTAssertNil(viewModel.didDismissWithCurrencies)
    }
}
