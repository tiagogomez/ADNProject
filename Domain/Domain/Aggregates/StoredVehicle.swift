//
//  StoredVehicle.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import Foundation

final class StoredVehicle {
    
    let entryDate: Date
    let vehicle: Vehicle
    
    init(entryDate: Date, vehicle: Vehicle) {
        self.entryDate = entryDate
        self.vehicle = vehicle
    }
}
