//
//  ParkingErrors.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 9/03/21.
//

import Foundation


public enum ParkingErrors: Error {
    case noCapacityForVehicle
    case invalidPlateForDay
    case plateAlreadyIngressed
    
    public var errorDescription: String {
        switch self {
        case .noCapacityForVehicle: return "No hay cupo para el vehículo que desea ingresar"
        case .invalidPlateForDay: return "El vehículo con la placa que desea ingresar no puede este día"
        case .plateAlreadyIngressed: return "El vehículo que desea ingresar ya fue registrado"
        }
    }
        
}
