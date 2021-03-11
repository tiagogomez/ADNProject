//
//  MockParkingRepository.swift
//  DomainTests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 11/03/21.
//

import Foundation

class MockParkingRepository: ParkingRepository {
    public var storedVehicles: [StoredVehicle] = []
    
    func storeVehicle(licensePlate: String, cylinderCapacity: Int, vehicleType: String, date: Date) {
        var vehicle: Vehicle
        guard let type = VehicleType(rawValue: vehicleType) else {
            return
        }
        switch type {
        case .car:
            vehicle = Car(cylinderCapacity: cylinderCapacity, licensePlate: licensePlate)
        case .motorcycle:
            vehicle = Motorcycle(cylinderCapacity: cylinderCapacity, licensePlate: licensePlate)
        }
        storedVehicles.append(StoredVehicle(entryDate: date, vehicle: vehicle))
    }
    
    func getStoredVehicles() -> [StoredVehicle] {
        return storedVehicles
    }
    
    func removeStoredVehicle(vehicle: StoredVehicle) {
        storedVehicles = storedVehicles.filter {$0.vehicle.getLicensePlate() != vehicle.vehicle.getLicensePlate()}
    }
    
    
}
