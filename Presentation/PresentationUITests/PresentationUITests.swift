//
//  PresentationUITests.swift
//  PresentationUITests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import XCTest

class PresentationUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func testEnterEmptyVehicle() throws {
        let enterVehicleButton = app/*@START_MENU_TOKEN@*/.staticTexts["Ingresar Vehículo"]/*[[".buttons[\"Ingresar Vehículo\"].staticTexts[\"Ingresar Vehículo\"]",".staticTexts[\"Ingresar Vehículo\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let alertMessage = app.alerts["No puede ingresar"].scrollViews.otherElements.buttons["OK"]
        
        enterVehicleButton.tap()
        XCTAssertTrue(alertMessage.exists)
    }
    
    func testPressExitVehicleButton() throws {
        let exitVehicleButton = app.buttons["Sacar Vehículo"]
        let storedVehicleView = app.navigationBars["Stored vehicles"].staticTexts["Stored vehicles"]
        
        exitVehicleButton.tap()
        XCTAssertTrue(storedVehicleView.exists)
    }
    
    func testPresentBillView() throws {
        let exitVehicleButton = app/*@START_MENU_TOKEN@*/.staticTexts["Sacar Vehículo"]/*[[".buttons[\"Sacar Vehículo\"].staticTexts[\"Sacar Vehículo\"]",".staticTexts[\"Sacar Vehículo\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let storedVehicle = app.tables/*@START_MENU_TOKEN@*/.staticTexts["car - placa: AAA345"]/*[[".cells.staticTexts[\"car - placa: AAA345\"]",".staticTexts[\"car - placa: AAA345\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let billView = app/*@START_MENU_TOKEN@*/.scrollViews.containing(.staticText, identifier:"Placa del Vehículo:").element/*[[".scrollViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".scrollViews.containing(.other, identifier:\"Vertical scroll bar, 1 page\").element",".scrollViews.containing(.button, identifier:\"Sacar Vehículo\").element",".scrollViews.containing(.staticText, identifier:\"8000\").element",".scrollViews.containing(.staticText, identifier:\"Costo $:\").element",".scrollViews.containing(.staticText, identifier:\"0\").element",".scrollViews.containing(.staticText, identifier:\"Horas: \").element",".scrollViews.containing(.staticText, identifier:\"1\").element",".scrollViews.containing(.staticText, identifier:\"Días:\").element",".scrollViews.containing(.staticText, identifier:\"car\").element",".scrollViews.containing(.staticText, identifier:\"Tipo:\").element",".scrollViews.containing(.staticText, identifier:\"500\").element",".scrollViews.containing(.staticText, identifier:\"Cilindraje:\").element",".scrollViews.containing(.staticText, identifier:\"AAA345\").element",".scrollViews.containing(.staticText, identifier:\"Placa del Vehículo:\").element"],[[[-1,14],[-1,13],[-1,12],[-1,11],[-1,10],[-1,9],[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        exitVehicleButton.tap()
        storedVehicle.tap()
        XCTAssertTrue(billView.exists)
    }
}
