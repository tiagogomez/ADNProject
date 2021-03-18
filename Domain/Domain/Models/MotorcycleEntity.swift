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
    private let cylinderCapacity: Int
    
    public init(cylinderCapacity: Int, licensePlate: String) {
        self.cylinderCapacity = cylinderCapacity
        super.init(licensePlate: licensePlate,
                   hourPrice: motorcycleHourPrice,
                   dayPrice: motorcycleDayPrice)
    }
    
    public func getCylinderCapacity() -> Int {
        return cylinderCapacity
    }
    
    public override func vehicleType() -> VehicleType {
        return VehicleType.motorcycle
    }
}
