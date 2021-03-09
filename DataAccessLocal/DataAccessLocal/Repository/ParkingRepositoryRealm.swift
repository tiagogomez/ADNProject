//
//  ParkingRepositoryRealm.swift
//  DataAccessLocal
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 5/03/21.
//

import Domain
import RealmSwift

public class ParkingRepositoryRealm: ParkingRepository {
    
    private var database: Realm
    
    public init() {
        try! database = Realm()
    }
    
    public func storeVehicle(licensePlate: String, cylinderCapacity: Int, vehicleType: String, date: Date) {
        let vehicle = VehicleEntity()
        vehicle.licensePlate = licensePlate
        vehicle.cylinderCapacity = cylinderCapacity
        vehicle.vehicleType = vehicleType
        let storedVehicle = StoredVehicleEntity()
        storedVehicle.entryDate = date
        storedVehicle.vehicle = vehicle
        
        try! database.write() {
            database.add(storedVehicle)
        }
    }
    
    public func getStoredVehicles() -> [StoredVehicle] {
        let storedEntities = database.objects(StoredVehicleEntity.self)
        
        return mapStoredEntityToStoredVehicle(entities: storedEntities)
    }
    
    public func removeStoredVehicle(vehicle: StoredVehicle) {
//        let vehicleToRemove = storedVehicleToEntity(storedVehicle: vehicle)
        let vehicleToRemove = database.objects(StoredVehicleEntity.self).filter("vehicle.licensePlate=%@",vehicle.vehicle.getLicensePlate())
        try! database.write {
            database.delete(vehicleToRemove)
        }
    }
    
    private func mapStoredEntityToStoredVehicle(entities: Results<StoredVehicleEntity>) -> [StoredVehicle] {
        var storedVehicles: [StoredVehicle] = []
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
    
//    private func storedVehicleToEntity(storedVehicle: StoredVehicle) -> StoredVehicleEntity {
//        let vehicleEntity = VehicleEntity()
//        vehicleEntity.licensePlate = storedVehicle.vehicle.getLicensePlate()
//        vehicleEntity.cylinderCapacity = storedVehicle.vehicle.getCylinderCapacity()
//        vehicleEntity.vehicleType = storedVehicle.vehicle.vehicleType().rawValue
//
//        let storedVehicleEntity = StoredVehicleEntity()
//        storedVehicleEntity.entryDate = storedVehicle.entryDate
//        storedVehicleEntity.vehicle = vehicleEntity
//
//        return storedVehicleEntity
//    }
}