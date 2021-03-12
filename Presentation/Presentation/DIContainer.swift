//
//  DIContainer.swift
//  Presentation
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 9/03/21.
//

import Swinject
import Domain
import DataAccessLocal

public class DIContainer {
    
    private let container: Container = Container()
    
    func registerDependencies() throws {
        container.register(ParkingRepository.self) {
            _ in ParkingRepositoryRealm()
        }
        
        container.register(ParkingService.self) {
            repository in ParkingService(parkingEntity: ParkingEntity(),
                                         parkingRepository: repository.resolve(ParkingRepository.self)!)
        }
    }
    
    func getContainer() -> Container {
        return container
    }
}
