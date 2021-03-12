//
//  Vehicle.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import Foundation

public enum VehicleType: String {
    case car
    case motorcycle
}

public class Vehicle {
    
    private let cylinderCapacity: Int
    private let licensePlate: String
    private let hourPrice: Int
    private let dayPrice: Int
    
    public init(cylinderCapacity: Int, licensePlate: String, hourPrice: Int, dayPrice: Int) {
        self.cylinderCapacity = cylinderCapacity
        self.licensePlate = licensePlate
        self.hourPrice = hourPrice
        self.dayPrice = dayPrice
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
