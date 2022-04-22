//
//  CarMapCoordinatorObject.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 19.04.2022.
//

import Foundation
import SixtTestCore

// MARK: - NavigationEvent

enum CarMapNavigationEvent: NavigationEvent {
    
    case showDetails(Car)
    
}

final class CarMapCoordinatorObject: CoordinatorObject, ObservableObject {
    
    // MARK: - Public properties
    
    @Published var mapViewModel: CarMapViewModel!
    @Published var detailViewModel: CarDetailViewModel?
    
    // MARK: - Initialization
    
    override init(appCoordinating: AppCoordinating) {
        super.init(appCoordinating: appCoordinating)
        
        let carsService: CarsService = appCoordinating.serviceLocator.getService()
        mapViewModel = CarMapViewModel(navigationEventHandler: self, carsService: carsService)
    }
    
}

// MARK: - NavigationEventHandling

extension CarMapCoordinatorObject: NavigationEventHandling {
    
    func handleNavigationEvent(_ event: NavigationEvent) {
        if let event = event as? CarMapNavigationEvent {
            switch event {
            case .showDetails(let car):
                detailViewModel = CarDetailViewModel(model: car, navigationEventHandler: self)
            }
        }
    }
    
}

