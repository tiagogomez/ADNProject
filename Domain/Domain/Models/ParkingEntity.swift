//
//  ParkingEntity.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/03/21.
//

import Foundation

public class ParkingEntity {
    
    let carsLimit: Int
    let motorcyclesLimit: Int
    let restrictedPlateLetter = "a"
    let todayDate: Date
    
    public init(todayDate: Date = Date(),
                carsLimit: Int = 20,
                motorcyclesLimit: Int = 10) {
        self.todayDate = todayDate
        self.carsLimit = carsLimit
        self.motorcyclesLimit = motorcyclesLimit
    }
}
