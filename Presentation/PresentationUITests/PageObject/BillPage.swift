//
//  BillPage.swift
//  PresentationUITests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/03/21.
//

import XCTest

class BillPage {
    var app: XCUIApplication
    
    var billPageHeader: XCUIElement { return app.navigationBars["Bill View"] }
    
    required init(app: XCUIApplication) {
        self.app = app
    }
}
