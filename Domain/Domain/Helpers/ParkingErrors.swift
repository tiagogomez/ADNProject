//
//  ParkingErrors.swift
//  Domain
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 9/03/21.
//

import Foundation

public enum ParkingErrors: Error {
    
    case NoCapacityForVehicle(message: String = "No hay cupo para el vehículo que desea ingresar")
    case InvalidPlateForDay(message: String = "El vehículo con la placa que desea ingresar no puede este día")
    case PlateAlreadyIngressed(message: String = "El vehículo que desea ingresar ya fue registrado")
}
