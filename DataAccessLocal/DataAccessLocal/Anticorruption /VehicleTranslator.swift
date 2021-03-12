//
//  VehicleTranslator.swift
//  DataAccessLocal
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/03/21.
//

import Domain
import RealmSwift

class VehicleTranslator {
    
    func mapStoredEntityToStoredVehicle(entities: Results<StoredVehicleEntity>?) -> [StoredVehicle] {
        var storedVehicles: [StoredVehicle] = []
        guard let entities = entities else {
            return storedVehicles
        }
        for entity in entities {
            var vehicle: Vehicle

            guard let vehicleEntity = entity.vehicle,
                  let vehicleType = VehicleType(rawValue: vehicleEntity.vehicleType) else {
                break
            }
            switch vehicleType {
            case .car:
                vehicle = Car(cylinderCapacity: vehicleEntity.cylinderCapacity, licensePlate: vehicleEntity.licensePlate)
            case .motorcycle:
                vehicle = Motorcycle(cylinderCapacity: vehicleEntity.cylinderCapacity, licensePlate: vehicleEntity.licensePlate)
            }
            storedVehicles.append(StoredVehicle(entryDate: entity.entryDate, vehicle: vehicle))
        }
        return storedVehicles
    }
}
