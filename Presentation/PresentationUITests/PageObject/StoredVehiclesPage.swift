//
//  StoredVehiclesPage.swift
//  PresentationUITests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/03/21.
//

import XCTest

class StoredVehiclesPage {
    var app: XCUIApplication
    
    var storedVehicleHeader: XCUIElement { return app.navigationBars["Stored vehicles"] }
    private var storedVehicle: XCUIElement { return app.tables.staticTexts["car - placa: AAA345"] }
    
    required init(app: XCUIApplication) {
        self.app = app
    }
    
    func tapStoredVehicle() {
        storedVehicle.tap()
    }
}
