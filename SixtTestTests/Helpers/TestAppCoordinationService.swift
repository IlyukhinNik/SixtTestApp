//
//  TestAppCoordinationService.swift
//  SixtTestTests
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation
import SixtTestCore
@testable import SixtTest

struct TestAppCoordinationService: AppCoordinating {
    
    let serviceLocator: ServiceLocator = ServiceLocator()
    
    private let carsService: CarsService
    
    init(networkProvider: NetworkProvider<CarsClient> = NetworkProvider()) {
        carsService = CarsService(networkService: NetworkingService<CarsClient>(provider: networkProvider))
        serviceLocator.registerService(carsService)
    }
}
