//
//  HomeUIScreen.swift
//  CurrencyRatesUITests
//
//  Created by Magnus Holm on 31/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest

enum HomeUIScreen {
    case addCurrencyPairView, addCurrencyPairHeaderView, tableView
    
    func component(in app: XCUIApplication) -> XCUIElement {
        switch self {
        case .addCurrencyPairView:
            return app.otherElements["addCurrencyPairViewIdentifier"]
        case .addCurrencyPairHeaderView:
            return app.otherElements["addCurrencyHeaderViewIdentifier"]
        case .tableView:
            return app.tables["homeScreenTableViewIdentifier"]
        }
    }
    
    static func assertScreenExist(in app: XCUIApplication) {
        XCTAssert(HomeUIScreen.addCurrencyPairView.component(in: app).exists)
        XCTAssert(HomeUIScreen.tableView.component(in: app).exists)
    }
    
    static func assertHeaderView(in app: XCUIApplication) {
        XCTAssert(HomeUIScreen.addCurrencyPairHeaderView.component(in: app).waitForExistence(timeout: 5))
        XCTAssert(HomeUIScreen.tableView.component(in: app).exists)
        XCTAssert(HomeUIScreen.tableView.component(in: app).cells.allElementsBoundByIndex.first!.exists)
    }
}

