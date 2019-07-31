//
//  HomeScreenViewModelTests.swift
//  CurrencyRatesTests
//
//  Created by Magnus Holm on 31/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest
@testable import CurrencyRates

class HomeScreenViewModelTests: XCTestCase {
    
    var viewModel: HomeScreenViewModelType!
    var apiServiceMock: APIServiceMock!
    var dataSource: HomeScreenDataSource!
    
    var mockCurrencies = ["GBPUSD", "USDGBP"]
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
        apiServiceMock = APIServiceMock()
        dataSource = HomeScreenDataSource()
        dataSource.stringPairs = mockCurrencies
        viewModel = HomeScreenViewModel(dataSource: dataSource, apiService: apiServiceMock)
    }
    
    func testCallbacksAreSetupAndDefined() {
        XCTAssertNotNil(viewModel.dataSource.shouldStopFetchingRates)
        XCTAssertNotNil(viewModel.dataSource.shouldContinueFetchingRates)
    }
    
    func testGetExchangeRatesFetchesAndParsesCorrectData() {
        viewModel.getExchangeRates(for: mockCurrencies)
        
        
        XCTAssertEqual(viewModel.dataSource.currencyPairs[0].pair, mockPairs[0].pair)
        XCTAssertEqual(viewModel.dataSource.currencyPairs[0].mainCurrency.name, mockPairs[0].mainCurrency.name)
        XCTAssertEqual(viewModel.dataSource.currencyPairs[0].mainCurrency.acronym, mockPairs[0].mainCurrency.acronym)
        XCTAssertEqual(viewModel.dataSource.currencyPairs[0].mainCurrency.flag, mockPairs[0].mainCurrency.flag)
        
        XCTAssertEqual(viewModel.dataSource.currencyPairs[1].pair, mockPairs[1].pair)
        XCTAssertEqual(viewModel.dataSource.currencyPairs[1].mainCurrency.name, mockPairs[1].mainCurrency.name)
        XCTAssertEqual(viewModel.dataSource.currencyPairs[1].mainCurrency.acronym, mockPairs[1].mainCurrency.acronym)
        XCTAssertEqual(viewModel.dataSource.currencyPairs[1].mainCurrency.flag, mockPairs[1].mainCurrency.flag)
        
        XCTAssertEqual(viewModel.dataSource.currencyPairs.count, 2)
    }
}
