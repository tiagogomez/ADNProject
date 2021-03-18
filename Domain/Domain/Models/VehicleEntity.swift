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
    
    private let licensePlate: String
    private let hourPrice: Int
    private let dayPrice: Int
    
    public init(licensePlate: String, hourPrice: Int, dayPrice: Int) {
        self.licensePlate = licensePlate
        self.hourPrice = hourPrice
        self.dayPrice = dayPrice
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
