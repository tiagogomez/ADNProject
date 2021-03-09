//
//  ParkingRepository.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 9/03/21.
//

import Foundation

public protocol ParkingRepository {
    
    func storeVehicle(licensePlate: String, cylinderCapacity: Int, vehicleType: String, date: Date)
    func getStoredVehicles() -> [StoredVehicle]
    func removeStoredVehicle(vehicle: StoredVehicle)
}
