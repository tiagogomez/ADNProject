//
//  ParkingService.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import Foundation

public final class ParkingService {
    
    private let parkingEntity: ParkingEntity
    private let parkingRepository: ParkingRepository
        
    public init(parkingEntity: ParkingEntity,
                parkingRepository: ParkingRepository) {
        self.parkingEntity = parkingEntity
        self.parkingRepository = parkingRepository
    }
    
    public func getParkedVehicles() -> [StoredVehicle] {
        return parkingRepository.getStoredVehicles()
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
            throw ParkingErrors.plateAlreadyIngressed
        }
        guard isThereCapacity(for: vehicle) else {
            throw ParkingErrors.noCapacityForVehicle
        }
        guard isDayValidForPlate(licensePlate: licensePlate) else {
            throw ParkingErrors.invalidPlateForDay
        }
        
        parkingRepository.storeVehicle(licensePlate: licensePlate,
                                       cylinderCapacity: cylinderCapacity,
                                       vehicleType: type.rawValue,
                                       date: parkingEntity.todayDate)
    }
    
    public func exitVehicle(storedVehicle: StoredVehicle) {
        parkingRepository.removeStoredVehicle(vehicle: storedVehicle)
    }
    
    private func isThereCapacity(for vehicle: Vehicle) -> Bool {
        let storedVehicles = parkingRepository.getStoredVehicles()
        switch vehicle.vehicleType() {
        case .car:
            let storedCars = storedVehicles.filter {$0.vehicle.vehicleType() == .car}.count
            guard storedCars < parkingEntity.carsLimit else {
                return false
            }
            return true
        case .motorcycle:
            let storedMotorcycles = storedVehicles.filter {$0.vehicle.vehicleType() == .motorcycle}.count
            guard storedMotorcycles < parkingEntity.motorcyclesLimit else {
                return false
            }
            return true
        }
    }
    
    private func isDayValidForPlate(licensePlate: String) -> Bool {
        let firstLetter = licensePlate.first?.lowercased()
        let weekday = Calendar.current.component(.weekday, from: parkingEntity.todayDate)
        
        // weekday 1: Sunday
        // weekday 1: Monday
        if firstLetter == parkingEntity.restrictedPlateLetter && (weekday != 1 && weekday != 2) {
            return false
        }
        return true
    }
    
    private func isPlateAlreadyIngressed(licensePlate: String) -> Bool {
        let storedVehicles = parkingRepository.getStoredVehicles()
        if !(storedVehicles.filter {$0.vehicle.getLicensePlate() == licensePlate}.isEmpty) {
            return false
        }
        return true
    }

}
