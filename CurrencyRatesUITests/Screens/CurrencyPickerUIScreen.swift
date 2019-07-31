//
//  CurrencyPickerUIScreen.swift
//  CurrencyRatesUITests
//
//  Created by Magnus Holm on 31/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest

enum CurrencyPickerUIScreen {
    case tableView, currencyTableViewCell
    
    func component(in app: XCUIApplication) -> XCUIElement {
        switch self {
        case .tableView:
            return app.tables["currencyPickerTableViewIdentifier"]
        case .currencyTableViewCell:
            return app.tables["currencyPickerTableViewCellIdentifier"]
        }
    }
    
    static func assertScreenExist(in app: XCUIApplication) {
        XCTAssert(CurrencyPickerUIScreen.tableView.component(in: app).exists)
    }
}
