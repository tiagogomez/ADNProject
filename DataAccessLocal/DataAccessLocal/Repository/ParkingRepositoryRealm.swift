//
//  ParkingRepositoryRealm.swift
//  DataAccessLocal
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 5/03/21.
//

import Domain
import RealmSwift

public class ParkingRepositoryRealm: ParkingRepository {
    
    private let realmConfig = RealmConfiguration()
    
    public init() {}
    
    public func storeVehicle(licensePlate: String, cylinderCapacity: Int, vehicleType: String, date: Date) {
        let vehicle = VehicleEntity()
        vehicle.licensePlate = licensePlate
        vehicle.cylinderCapacity = cylinderCapacity
        vehicle.vehicleType = vehicleType
        let storedVehicle = StoredVehicleEntity()
        storedVehicle.entryDate = date
        storedVehicle.vehicle = vehicle
        
        try? realmConfig.database?.write() {
            realmConfig.database?.add(storedVehicle)
        }
    }
    
    public func getStoredVehicles() -> [StoredVehicle] {
        let storedEntities = realmConfig.database?.objects(StoredVehicleEntity.self)
        let vehicleTranslator = VehicleTranslator()
        
        return vehicleTranslator.mapStoredEntityToStoredVehicle(entities: storedEntities)
    }
    
    public func removeStoredVehicle(vehicle: StoredVehicle) {
        guard let vehicleToRemove = realmConfig.database?.objects(StoredVehicleEntity.self).filter("vehicle.licensePlate=%@",vehicle.vehicle.getLicensePlate()) else {
            return
        }
        try? realmConfig.database?.write {
            realmConfig.database?.delete(vehicleToRemove)
        }
    }
}
