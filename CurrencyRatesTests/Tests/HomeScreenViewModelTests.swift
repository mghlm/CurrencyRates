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
        let expectation = self.expectation(description: "currencies")
        viewModel.getExchangeRates(for: mockCurrencies) {
            expectation.fulfill()
            
            self.wait(for: [expectation], timeout: 1)
            XCTAssertEqual(self.viewModel.dataSource.currencyPairs[0].pair, self.mockPairs[0].pair)
            XCTAssertEqual(self.viewModel.dataSource.currencyPairs[0].mainCurrency.name, self.mockPairs[0].mainCurrency.name)
            XCTAssertEqual(self.viewModel.dataSource.currencyPairs[0].mainCurrency.acronym, self.mockPairs[0].mainCurrency.acronym)
            XCTAssertEqual(self.viewModel.dataSource.currencyPairs[0].mainCurrency.flag, self.mockPairs[0].mainCurrency.flag)
            
            XCTAssertEqual(self.viewModel.dataSource.currencyPairs[1].pair, self.mockPairs[1].pair)
            XCTAssertEqual(self.viewModel.dataSource.currencyPairs[1].mainCurrency.name, self.mockPairs[1].mainCurrency.name)
            XCTAssertEqual(self.viewModel.dataSource.currencyPairs[1].mainCurrency.acronym, self.mockPairs[1].mainCurrency.acronym)
            XCTAssertEqual(self.viewModel.dataSource.currencyPairs[1].mainCurrency.flag, self.mockPairs[1].mainCurrency.flag)
            
            XCTAssertEqual(self.viewModel.dataSource.currencyPairs.count, 2)
        }
    }
}
