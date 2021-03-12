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

    func testPressEnterVehicleButton_withEmptyVehicleData_shouldPresentAlertMessage() throws {
        //Setup
        let homePage = HomePage(app: app)
        let alertMessage = AlertMessagePage(app: app)
        
        //Test
        homePage.tapEntryVehicleButton()
        
        //Verify
        XCTAssertTrue(alertMessage.alertMessageText.exists)
    }
    
    func testPressExitVehicleButton_shouldPresentStoredVehiclesPage() throws {
        //Setup
        let homePage = HomePage(app: app)
        let storedVehiclePage = StoredVehiclesPage(app: app)
        
        //Test
        homePage.tapExitVehicleButton()
        
        //Verify
        XCTAssertTrue(storedVehiclePage.storedVehicleHeader.exists)
    }
    
    func testSelectStoredVehicle_shouldPresentBillPage() throws {
        //Setup
        let homePage = HomePage(app: app)
        let storedVehiclePage = StoredVehiclesPage(app: app)
        let billPage = BillPage(app: app)
        homePage.tapExitVehicleButton()
        
        //Test
        storedVehiclePage.tapStoredVehicle()
        
        //Verify
        XCTAssertTrue(billPage.billPageHeader.exists)
    }
}
