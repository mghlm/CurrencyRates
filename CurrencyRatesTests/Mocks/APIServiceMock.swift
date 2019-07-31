//
//  APIServiceMock.swift
//  CurrencyRatesTests
//
//  Created by Magnus Holm on 31/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest
@testable import CurrencyRates

final class APIServiceMock: APIServiceType {
    func buildRequest(for endpoint: Endpoint) -> URLRequest? {
        return nil 
    }
    
    var isSucceeded: Bool = true
    
    let currencyPairsModel = ["GBPUSD": 1.123, "USDGBP": 0.876]
    
    func request(endpoint: Endpoint, completion: @escaping (Result<[String : Any], NetworkError>) -> ()) {
        if isSucceeded {
            let currencyPairModel = self.currencyPairsModel
            isSucceeded = false
            completion(.success(currencyPairModel))
        } else {
            completion(.failure(.apiError))
        }
    }
}
