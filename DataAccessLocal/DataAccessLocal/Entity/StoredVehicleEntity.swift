//
//  StoredVehicleEntity.swift
//  DataAccessLocal
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 5/03/21.
//

import RealmSwift

class StoredVehicleEntity: Object {
    
    @objc dynamic var entryDate: Date = Date()
    @objc dynamic var vehicle: VehicleEntity? = nil
}
