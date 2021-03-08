//
//  StoredVehicle.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import Foundation

public final class StoredVehicle {
    
    public let entryDate: Date
    public let vehicle: Vehicle
    
    init(entryDate: Date, vehicle: Vehicle) {
        self.entryDate = entryDate
        self.vehicle = vehicle
    }
}
