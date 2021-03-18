//
//  BillEntity.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/03/21.
//

import Foundation

public class BillEntity {
    
    let cylinderCapacityLimit = 500
    let fiveHundredCCExtraCost = 2000

    public var billCost: Int?
    public var stayedDays: Int?
    public var stayedHours: Int?
    
    public init() {}
    
    public func getStayedDaysAndHours(from entryDate: Date, to exitDate: Date?) -> (Int, Int) {
        let currentCalendar = Calendar.current
        let numberOfDays = currentCalendar.dateComponents([.day, .hour], from: entryDate, to: exitDate ?? Date())
        var days = numberOfDays.day ?? 0
        var hours = numberOfDays.hour ?? 0
        if hours >= 9 {
            days = days + 1
            hours = 0
        }
        self.stayedDays = days
        self.stayedHours = hours
        return(days, hours)
    }
}
