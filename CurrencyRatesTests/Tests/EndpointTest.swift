//
//  EndpointTest.swift
//  CurrencyRatesTests
//
//  Created by Magnus Holm on 31/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest
@testable import CurrencyRates

class EndpointTest: XCTestCase {
    
    var apiService: APIServiceType!
    
    override func setUp() {
        apiService = APIService()
    }
    
    func testEndpointRequestCreatedCorrectly() {
        let endpoint = Endpoint.getCurrencyPairs(currencyPairs: ["GBPEUR", "EURGBP"])
        let urlRequest = apiService.buildRequest(for: endpoint)
        
        XCTAssertEqual(urlRequest!.url, URL(string: "https://europe-west1-revolut-230009.cloudfunctions.net/revolut-ios?pairs=GBPEUR&pairs=EURGBP"))
        XCTAssertEqual(urlRequest!.httpMethod, "GET")
    }
}
