//
//  ParkingTests.swift
//  ParkingTests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import XCTest
@testable import Domain

class ParkingTests: XCTestCase {
    
    func testEnterVehicle_WithValidVehicle_ShouldStoreTheVehicle() {
        //Setup
        let mockCylinderCapacity = 100
        let mockLicensePlate = "B5830"
        let parking = Parking()
        
        //Test
        let parked = parking.enterVehicle(licensePlate: mockLicensePlate, cylinderCapacity: mockCylinderCapacity, type: .car)
        
        //Verify
        let storedCar = parking.storedVehicles.first?.vehicle
        XCTAssertEqual(storedCar?.getCylinderCapacity(), mockCylinderCapacity)
        XCTAssertEqual(storedCar?.getLicensePlate(), mockLicensePlate)
        XCTAssertTrue(parked)
    }
    
    func testEnterVehicle_With_A_StartingPlateOnMonday_ShouldNotStoreTheVehicle() {
        //Setup
        let mockCylinderCapacity = 100
        let mockLicensePlate = "A5830"
        let stringDate = "2021-03-01"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: stringDate)
        let parking = Parking(todayDate: date!)
        
        //Test
        let parked = parking.enterVehicle(licensePlate: mockLicensePlate, cylinderCapacity: mockCylinderCapacity, type: .car)
        
        //Verify
        let storedCars = parking.storedVehicles
        XCTAssertTrue(storedCars.isEmpty)
        XCTAssertFalse(parked)
    }
    
    func testEnterVehicle_With_A_StartingPlateOnTuesday_ShouldStoreTheVehicle() {
        //Setup
        let mockCylinderCapacity = 100
        let mockLicensePlate = "A5830"
        let stringDate = "2021-03-02"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: stringDate)
        let parking = Parking(todayDate: date!)
        
        //Test
        let parked = parking.enterVehicle(licensePlate: mockLicensePlate, cylinderCapacity: mockCylinderCapacity, type: .car)
        
        //Verify
        let storedCar = parking.storedVehicles.first?.vehicle
        XCTAssertEqual(storedCar?.getCylinderCapacity(), mockCylinderCapacity)
        XCTAssertEqual(storedCar?.getLicensePlate(), mockLicensePlate)
        XCTAssertTrue(parked)
    }
    
    func testEnterVehicle_WithValidVehicleButNoParkingCapacity_ShouldStoreTheVehicle() {
        //Setup
        let mockCylinderCapacity = 100
        let mockLicensePlate = "B5830"
        let parking = Parking(carsLimit: 1)
        parking.storedVehicles.append(StoredVehicle(entryDate: Date(), vehicle: Car(cylinderCapacity: mockCylinderCapacity, licensePlate: mockLicensePlate)))
        
        //Test
        let parked = parking.enterVehicle(licensePlate: mockLicensePlate, cylinderCapacity: mockCylinderCapacity, type: .car)
        
        //Verify
        XCTAssertFalse(parked)
    }

}
