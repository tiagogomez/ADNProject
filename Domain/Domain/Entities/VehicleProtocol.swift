//
//  VehicleProtocol.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import Foundation

public enum VehicleType: String {
    case car
    case motorcycle
}

public protocol Vehicle {
    
    func getCylinderCapacity() -> Int
    
    func getLicensePlate() -> String
    
    func getHourPrice() -> Int
    
    func getDayPrice() -> Int
    
    func vehicleType() -> VehicleType
}
