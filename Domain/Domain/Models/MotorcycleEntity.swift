//
//  Motorcycle.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import Foundation

public class Motorcycle: Vehicle {

    private let motorcycleHourPrice = 500
    private let motorcycleDayPrice = 4000
    
    public init(cylinderCapacity: Int, licensePlate: String) {
        super.init(cylinderCapacity: cylinderCapacity,
                   licensePlate: licensePlate,
                   hourPrice: motorcycleHourPrice,
                   dayPrice: motorcycleDayPrice)    }
    
    public override func vehicleType() -> VehicleType {
        return VehicleType.motorcycle
    }
}
