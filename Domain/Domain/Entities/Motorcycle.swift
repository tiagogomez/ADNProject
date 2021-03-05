//
//  Motorcycle.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import Foundation

public class Motorcycle: Vehicle {

    let cylinderCapacity: Int
    let licensePlate: String
    let hourPrice = 500
    let dayPrice = 4000
    
    init(cylinderCapacity: Int, licensePlate: String) {
        self.cylinderCapacity = cylinderCapacity
        self.licensePlate = licensePlate
    }
    
    func getCylinderCapacity() -> Int {
        return cylinderCapacity
    }
    
    func getLicensePlate() -> String {
        return licensePlate
    }
    
    func getHourPrice() -> Int {
        return hourPrice
    }
    
    func getDayPrice() -> Int {
        return dayPrice
    }
    
    func vehicleType() -> VehicleType {
        return VehicleType.motorcycle
    }
}
