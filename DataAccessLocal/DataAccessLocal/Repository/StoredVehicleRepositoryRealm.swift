//
//  StoredVehicleRepositoryRealm.swift
//  DataAccessLocal
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 5/03/21.
//

import Domain
import RealmSwift

public class StoredVehicleRepositoryRealm {
    
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
    
    public func getStoredVehicles() -> [StoredVehicle]? {
        let storedEntities = database.objects(StoredVehicleEntity.self)
        
        return mapStoredEntityToStoredVehicle(entities: storedEntities)
    }
    
    private func mapStoredEntityToStoredVehicle(entities: Results<StoredVehicleEntity>) -> [StoredVehicle]? {
        var storedVehicles: [StoredVehicle] = []

        for entity in entities {
            guard let vehicleTypeString = entity.vehicle?.vehicleType,
                  let vehicleType = VehicleType(rawValue: vehicleTypeString) else {
                break
            }
        }
        return nil
    }
}
