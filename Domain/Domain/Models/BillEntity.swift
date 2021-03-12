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
}
