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
        return VehicleType.car
    }
}