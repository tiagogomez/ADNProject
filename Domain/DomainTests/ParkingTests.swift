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
        let parking = Parking(parkingRepository: MockParkingRepository())
        
        //Test
        try? parking.enterVehicle(licensePlate: mockLicensePlate, cylinderCapacity: mockCylinderCapacity, type: .car)
        
        //Verify
        let storedCar = parking.getParkedVehicles().first?.vehicle
        XCTAssertEqual(storedCar?.getCylinderCapacity(), mockCylinderCapacity)
        XCTAssertEqual(storedCar?.getLicensePlate(), mockLicensePlate)
    }
    
    func testEnterVehicle_With_A_StartingPlateOnTuesday_ShouldNotStoreTheVehicle() {
        //Setup
        let mockCylinderCapacity = 100
        let mockLicensePlate = "A5830"
        let stringDate = "2021-03-02"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: stringDate)
        let parking = Parking(todayDate: date!, parkingRepository: MockParkingRepository())
        
        //Test
        try? parking.enterVehicle(licensePlate: mockLicensePlate, cylinderCapacity: mockCylinderCapacity, type: .car)
        
        //Verify
        let storedCars = parking.getParkedVehicles()
        XCTAssertTrue(storedCars.isEmpty)
    }
    
    func testEnterVehicle_With_A_StartingPlateOnMonday_ShouldStoreTheVehicle() {
        //Setup
        let mockCylinderCapacity = 100
        let mockLicensePlate = "A5830"
        let stringDate = "2021-03-01"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: stringDate)
        let parking = Parking(todayDate: date!, parkingRepository: MockParkingRepository())
        
        //Test
        try? parking.enterVehicle(licensePlate: mockLicensePlate, cylinderCapacity: mockCylinderCapacity, type: .car)
        
        //Verify
        let storedCar = parking.getParkedVehicles().first?.vehicle
        XCTAssertEqual(storedCar?.getCylinderCapacity(), mockCylinderCapacity)
        XCTAssertEqual(storedCar?.getLicensePlate(), mockLicensePlate)
    }
    
    func testEnterVehicle_WithValidVehicleButNoParkingCapacity_ShouldNotStoreTheVehicle() {
        //Setup
        let mockCylinderCapacity = 100
        let mockLicensePlate1 = "B5830"
        let mockLicensePlate2 = "Z6230"
        let mockParkingRepository = MockParkingRepository()
        mockParkingRepository.storedVehicles.append(StoredVehicle(entryDate: Date(), vehicle: Car(cylinderCapacity: mockCylinderCapacity, licensePlate: mockLicensePlate1)))
        let parking = Parking(carsLimit: 1, parkingRepository: mockParkingRepository)

        //Test
        do {
            try parking.enterVehicle(licensePlate: mockLicensePlate2, cylinderCapacity: mockCylinderCapacity, type: .car)
        } catch ParkingErrors.NoCapacityForVehicle(let message) {

            //Verify
            XCTAssertEqual(message, "No hay cupo para el vehículo que desea ingresar")
        } catch {
            XCTFail()
        }
    }
}
