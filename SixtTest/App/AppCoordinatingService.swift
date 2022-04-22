//
//  AppCoordinatingService.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation
import SixtTestCore

struct AppCoordinatingService: AppCoordinating {
    
    let serviceLocator: ServiceLocator = ServiceLocator()
    
    private let carsService: CarsService
    
    init() {
        carsService = CarsService(networkService: NetworkingService<CarsClient>())
        serviceLocator.registerService(carsService)
    }
    
}
