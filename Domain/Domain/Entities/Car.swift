//
//  Car.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import Foundation

public class Car: Vehicle {

    let cylinderCapacity: Int
    let licensePlate: String
    let hourPrice = 1000
    let dayPrice = 8000
    
    public init(cylinderCapacity: Int, licensePlate: String) {
        self.cylinderCapacity = cylinderCapacity
        self.licensePlate = licensePlate
    }
    
    public func getCylinderCapacity() -> Int {
        return cylinderCapacity
    }
    
    public func getLicensePlate() -> String {
        return licensePlate
    }
    
    public func getHourPrice() -> Int {
        return hourPrice
    }
    
    public func getDayPrice() -> Int {
        return dayPrice
    }
    
    public func vehicleType() -> VehicleType {
        return VehicleType.car
    }
}
