//
//  CurrencyRatesUITests.swift
//  CurrencyRatesUITests
//
//  Created by Magnus Holm on 26/07/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest

class CurrencyRatesUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testAddCurrencyPairFlow() {
        
        // Assert Home Screen
        HomeUIScreen.assertScreenExist(in: app)
        
        // Assert Currency Picker screen
        HomeUIScreen.addCurrencyPairView.component(in: app).tap()
        CurrencyPickerUIScreen.assertScreenExist(in: app)
        
        // Assert Currency Picker screen
        CurrencyPickerUIScreen.tableView.component(in: app).cells.allElementsBoundByIndex.first?.tap()
        CurrencyPickerUIScreen.assertScreenExist(in: app)
        
        // Assert Home Screen with Currency Pair Rates
        CurrencyPickerUIScreen.tableView.component(in: app).cells.element(boundBy: 1).tap()
        HomeUIScreen.assertHeaderView(in: app)
        
        // Assert Home Screen after delete cell
        homeScreenExistAfterDeleteCell()
    }
    
    func homeScreenExistAfterDeleteCell() {
        let cell = HomeUIScreen.tableView.component(in: app).cells.allElementsBoundByIndex.first!
        
        let rightOffset = CGVector(dx: 0.95, dy: 0.5)
        let leftOffset = CGVector(dx: 0.05, dy: 0.5)
        
        let cellFarRightCoordinate = cell.coordinate(withNormalizedOffset: rightOffset)
        let cellFarLeftCoordinate = cell.coordinate(withNormalizedOffset: leftOffset)
        
        cellFarRightCoordinate.press(forDuration: 0.1, thenDragTo: cellFarLeftCoordinate)
        
        HomeUIScreen.assertScreenExist(in: app)
    }
}
