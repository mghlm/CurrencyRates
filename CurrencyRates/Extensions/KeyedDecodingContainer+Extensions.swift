//
//  KeyedDecodingContainer+Extensions.swift
//  CurrencyRates
//
//  Created by Magnus Holm on 29/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import Foundation

//extension KeyedDecodingContainer where Key == AdditionalDataCodingKeys {
//    func decodeUnknownKeyValues<T: CodingKey>(exclude keyedBy: T.Type) -> [String: Any] {
//        var data = [String: Any]()
//        
//        for key in allKeys {
//            if keyedBy.init(stringValue: key.stringValue) == nil {
//                if let value = try? decode(String.self, forKey: key) {
//                    data[key.stringValue] = value
//                }
//                else if let value = try? decode(Bool.self, forKey: key) {
//                    data[key.stringValue] = value
//                }
//                else if let value = try? decode(Int.self, forKey: key) {
//                    data[key.stringValue] = value
//                }
//                else if let value = try? decode(Double.self, forKey: key) {
//                    data[key.stringValue] = value
//                }
//                else if let value = try? decode(Float.self, forKey: key) {
//                    data[key.stringValue] = value
//                }
//                else {
//                    NSLog("Key %@ type not supported", key.stringValue)
//                }
//            }
//        }
//        return data
//    }
//}
