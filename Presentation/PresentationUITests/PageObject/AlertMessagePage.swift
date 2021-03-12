//
//  AlertMessagePage.swift
//  PresentationUITests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/03/21.
//

import XCTest

class AlertMessagePage {
    var app: XCUIApplication
    
    var alertMessageText: XCUIElement { return app.alerts["No puede ingresar"] }
    
    required init(app: XCUIApplication) {
        self.app = app
    }
}
