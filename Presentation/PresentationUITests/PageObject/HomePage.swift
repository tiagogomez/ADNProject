//
//  HomePage.swift
//  PresentationUITests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/03/21.
//

import XCTest

class HomePage {

    var app: XCUIApplication
    
    private var entryVehicleButton: XCUIElement { return app.buttons["Ingresar Vehículo"] }
    private var exitVehicleButton: XCUIElement { return app.buttons["Sacar Vehículo"] }
    
    required init(app: XCUIApplication) {
        self.app = app
    }
    
    func tapEntryVehicleButton() {
        entryVehicleButton.tap()
    }
    
    func tapExitVehicleButton() {
        exitVehicleButton.tap()
    }
}
