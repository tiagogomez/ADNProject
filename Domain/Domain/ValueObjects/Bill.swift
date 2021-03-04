//
//  Bill.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import Foundation

class Bill {
    
    let cylinderCapacityLimit = 500
    let fiveHundredCCExtraCost = 2000

    func generateBill(for storedVehicle: StoredVehicle, with exitDate: Date) -> Int {
        let (days, hours) = getStayedDaysAndHours(from: storedVehicle.entryDate, to: exitDate)
        let vehicle = storedVehicle.vehicle
        
        return (days * vehicle.getDayPrice()) + (hours * vehicle.getHourPrice()) + extraCostIfNeeded(for: vehicle)
    }

    private func getStayedDaysAndHours(from entryDate: Date, to exitDate: Date?) -> (Int, Int) {
        let currentCalendar = Calendar.current
        let numberOfDays = currentCalendar.dateComponents([.day, .hour], from: entryDate, to: exitDate ?? Date())
        var days = numberOfDays.day ?? 0
        var hours = numberOfDays.hour ?? 0
        if hours >= 9 {
            days = days + 1
            hours = 0
        }
        return(days, hours)
    }
    
    private func extraCostIfNeeded(for vehicle: Vehicle) -> Int {
        if vehicle.vehicleType() == .motorcycle && vehicle.getCylinderCapacity() >= cylinderCapacityLimit {
            return fiveHundredCCExtraCost
        } else {
            return 0
        }
    }
}
