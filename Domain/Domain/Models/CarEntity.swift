//
//  Car.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import Foundation

public class Car: Vehicle {

    private let carHourPrice = 1000
    private let carDayPrice = 8000
    
    public init(licensePlate: String) {
        super.init(licensePlate: licensePlate,
                   hourPrice: carHourPrice,
                   dayPrice: carDayPrice)
    }
    
    public override func vehicleType() -> VehicleType {
        return VehicleType.car
    }
}
