//
//  Parking.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import Foundation

public final class Parking {
    
    public var storedVehicles: [StoredVehicle] = []
    let carsLimit:Int
    let motorcyclesLimit: Int
    let restrictedPlateLetter = "a"
    let todayDate: Date
    
    public static let shared = Parking()
    
    public init(todayDate: Date = Date(), carsLimit: Int = 20, motorcyclesLimit: Int = 10) {
        self.todayDate = todayDate
        self.carsLimit = carsLimit
        self.motorcyclesLimit = motorcyclesLimit
    }
    
    public func enterVehicle(licensePlate: String, cylinderCapacity: Int, type: VehicleType) throws {
        var vehicle: Vehicle
        switch type {
        case .car:
            vehicle = Car(cylinderCapacity: cylinderCapacity, licensePlate: licensePlate)
        case .motorcycle:
            vehicle = Motorcycle(cylinderCapacity: cylinderCapacity, licensePlate: licensePlate)
        }

        guard isPlateAlreadyIngressed(licensePlate: licensePlate) else {
            throw ParkingErrors.PlateAlreadyIngressed()
        }
        guard isThereCapacity(for: vehicle) else {
            throw ParkingErrors.NoCapacityForVehicle()
        }
        guard isDayValidForPlate(licensePlate: licensePlate) else {
            throw ParkingErrors.InvalidPlateForDay()
        }
        
        //Store vehicle
        storedVehicles.append(StoredVehicle(entryDate: todayDate, vehicle: vehicle))
    }
    
    public func exitVehicle(storedVehicle: StoredVehicle) {
        storedVehicles = storedVehicles.filter {$0.vehicle.getLicensePlate() != storedVehicle.vehicle.getLicensePlate()}
    }
    
    private func isThereCapacity(for vehicle: Vehicle) -> Bool {
        switch vehicle.vehicleType() {
        case .car:
            let storedCars = storedVehicles.filter {$0.vehicle.vehicleType() == .car}.count
            guard storedCars < carsLimit else {
                return false
            }
            return true
        case .motorcycle:
            let storedMotorcycles = storedVehicles.filter {$0.vehicle.vehicleType() == .motorcycle}.count
            guard storedMotorcycles < motorcyclesLimit else {
                return false
            }
            return true
        }
    }
    
    private func isDayValidForPlate(licensePlate: String) -> Bool {
        let firstLetter = licensePlate.first?.lowercased()
        let weekday = Calendar.current.component(.weekday, from: todayDate)
        
        // weekday 1: Sunday
        // weekday 1: Monday
        if firstLetter == restrictedPlateLetter && (weekday == 1 || weekday == 2) {
            return false
        }
        return true
    }
    
    private func isPlateAlreadyIngressed(licensePlate: String) -> Bool {
        if !(storedVehicles.filter {$0.vehicle.getLicensePlate() == licensePlate}.isEmpty) {
            return false
        }
        return true
    }

}
