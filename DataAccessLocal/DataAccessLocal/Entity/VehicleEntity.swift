//
//  VehicleEntity.swift
//  DataAccessLocal
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 5/03/21.
//

import RealmSwift

class VehicleEntity: Object {
    
    @objc dynamic var licensePlate: String = String()
    @objc dynamic var cylinderCapacity: Int = 0
    @objc dynamic var vehicleType: String = String()
}
