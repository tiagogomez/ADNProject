//
//  BillService.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 4/03/21.
//

import Foundation

public class BillService {
    
    public let billEntity: BillEntity
    
    public init(billEntity: BillEntity) {
        self.billEntity = billEntity
    }

    public func generateBill(for storedVehicle: StoredVehicle, with exitDate: Date) -> BillEntity {
        let (days, hours) = getStayedDaysAndHours(from: storedVehicle.entryDate, to: exitDate)
        let vehicle = storedVehicle.vehicle
        
        billEntity.billCost = (days * vehicle.getDayPrice()) + (hours * vehicle.getHourPrice()) + extraCostIfNeeded(for: vehicle)
        return billEntity
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
        billEntity.stayedDays = days
        billEntity.stayedHours = hours
        return(days, hours)
    }
    
    private func extraCostIfNeeded(for vehicle: Vehicle) -> Int {
        if vehicle.vehicleType() == .motorcycle && vehicle.getCylinderCapacity() >= billEntity.cylinderCapacityLimit {
            return billEntity.fiveHundredCCExtraCost
        } else {
            return 0
        }
    }
}
