//
//  BillTests.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 5/03/21.
//

import XCTest
@testable import Domain

class BillTests: XCTestCase {

    func testGenerateBill_ForStoredCar_ForThreeDays_ShouldReturn24000() {
        //Setup
        let mockCylinderCapacity = 100
        let mockLicensePlate = "B5830"
        let storedCar = Car(cylinderCapacity: mockCylinderCapacity, licensePlate: mockLicensePlate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let stringEntryDate = "2021-03-01"
        let entryDate = dateFormatter.date(from: stringEntryDate)
        let stringExitDate = "2021-03-04"
        let exitDate = dateFormatter.date(from: stringExitDate)
        
        let storedVehicle = StoredVehicle(entryDate: entryDate!, vehicle: storedCar)
        let billService = BillService(billEntity: BillEntity())
        
        //Test
        let bill = billService.generateBill(for: storedVehicle, with: exitDate!)
        
        //Verify
        XCTAssertEqual(bill.billCost, 24000)
    }
    
    func testGenerateBill_ForStoredMotorcycle_ForThreeDays_ShouldReturn12000() {
        //Setup
        let mockCylinderCapacity = 100
        let mockLicensePlate = "B5830"
        let storedCar = Motorcycle(cylinderCapacity: mockCylinderCapacity, licensePlate: mockLicensePlate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let stringEntryDate = "2021-03-01"
        let entryDate = dateFormatter.date(from: stringEntryDate)
        let stringExitDate = "2021-03-04"
        let exitDate = dateFormatter.date(from: stringExitDate)
        
        let storedVehicle = StoredVehicle(entryDate: entryDate!, vehicle: storedCar)
        let billService = BillService(billEntity: BillEntity())
        
        //Test
        let bill = billService.generateBill(for: storedVehicle, with: exitDate!)
        
        //Verify
        XCTAssertEqual(bill.billCost, 12000)
    }
    
    func testGenerateBill_ForStoredMotorcycle_ForThreeDaysWith500CC_ShouldReturn14000() {
        //Setup
        let mockCylinderCapacity = 500
        let mockLicensePlate = "B5830"
        let storedCar = Motorcycle(cylinderCapacity: mockCylinderCapacity, licensePlate: mockLicensePlate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let stringEntryDate = "2021-03-01"
        let entryDate = dateFormatter.date(from: stringEntryDate)
        let stringExitDate = "2021-03-04"
        let exitDate = dateFormatter.date(from: stringExitDate)
        
        let storedVehicle = StoredVehicle(entryDate: entryDate!, vehicle: storedCar)
        let billService = BillService(billEntity: BillEntity())
        
        //Test
        let bill = billService.generateBill(for: storedVehicle, with: exitDate!)
        
        //Verify
        XCTAssertEqual(bill.billCost, 14000)
    }
    
    func testGenerateBill_ForStoredCar_ForThreeHours_ShouldReturn3000() {
        //Setup
        let mockCylinderCapacity = 100
        let mockLicensePlate = "B5830"
        let storedCar = Car(cylinderCapacity: mockCylinderCapacity, licensePlate: mockLicensePlate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let stringEntryDate = "2021-03-01 06:00:00"
        let entryDate = dateFormatter.date(from: stringEntryDate)
        let stringExitDate = "2021-03-01 09:00:00"
        let exitDate = dateFormatter.date(from: stringExitDate)
        
        let storedVehicle = StoredVehicle(entryDate: entryDate!, vehicle: storedCar)
        let billService = BillService(billEntity: BillEntity())
        
        //Test
        let bill = billService.generateBill(for: storedVehicle, with: exitDate!)
        
        //Verify
        XCTAssertEqual(bill.billCost, 3000)
    }
    
    func testGenerateBill_ForStoredCar_ForNineHours_ShouldReturnDayPrice() {
        //Setup
        let mockCylinderCapacity = 100
        let mockLicensePlate = "B5830"
        let storedCar = Car(cylinderCapacity: mockCylinderCapacity, licensePlate: mockLicensePlate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let stringEntryDate = "2021-03-01 06:00:00"
        let entryDate = dateFormatter.date(from: stringEntryDate)
        let stringExitDate = "2021-03-01 15:00:00"
        let exitDate = dateFormatter.date(from: stringExitDate)
        
        let storedVehicle = StoredVehicle(entryDate: entryDate!, vehicle: storedCar)
        let billService = BillService(billEntity: BillEntity())
        
        //Test
        let bill = billService.generateBill(for: storedVehicle, with: exitDate!)
        
        //Verify
        XCTAssertEqual(bill.billCost, 8000)
    }

}
