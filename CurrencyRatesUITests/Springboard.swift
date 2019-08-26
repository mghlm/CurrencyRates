//
//  Springboard.swift
//  CurrencyRatesUITests
//
//  Created by Magnus Holm on 26/08/2019.
//  Copyright © 2019 Magnus Holm. All rights reserved.
//

import XCTest

class Springboard {
    
    static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    
    class func deleteMyApp() {
        XCUIApplication().terminate()
        
        let icon = springboard.icons["CurrencyRates"]
        if icon.exists {
            let iconFrame = icon.frame
            let springboardFrame = springboard.frame
            icon.press(forDuration: 1.3)
            
            springboard.coordinate(withNormalizedOffset: CGVector(dx: (iconFrame.minX + 3 * UIScreen.main.scale) / springboardFrame.maxX, dy: (iconFrame.minY + 3 * UIScreen.main.scale) / springboardFrame.maxY)).tap()
            
            Thread.sleep(forTimeInterval: 0.5)
            
            springboard.alerts.buttons["Delete"].tap()
        }
    }
    
    
}
