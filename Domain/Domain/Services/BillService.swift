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
        let (days, hours) = billEntity.getStayedDaysAndHours(from: storedVehicle.entryDate, to: exitDate)
        let vehicle = storedVehicle.vehicle
        
        billEntity.billCost = (days * vehicle.getDayPrice()) + (hours * vehicle.getHourPrice()) + extraCostIfNeeded(for: vehicle)
        return billEntity
    }
    
    private func extraCostIfNeeded(for vehicle: Vehicle) -> Int {
        if let vehicle = vehicle as? Motorcycle, vehicle.getCylinderCapacity() >= billEntity.cylinderCapacityLimit {
            return billEntity.fiveHundredCCExtraCost
        } else {
            return 0
        }
    }
}
