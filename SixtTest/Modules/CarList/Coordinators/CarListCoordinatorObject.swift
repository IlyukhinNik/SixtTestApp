//
//  CarListCoordinatorObject.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 20.04.2022.
//

import Foundation
import SixtTestCore

enum CarListNavigationEvent: NavigationEvent {
    case showDetail(Car)
}

final class CarListCoordinatorObject: CoordinatorObject, ObservableObject {

    // MARK: - Public properties
    
    @Published var listViewModel: CarsListViewModel!
    @Published var detailViewModel: CarDetailViewModel?
    
    // MARK: - Initialization
    
    override init(appCoordinating: AppCoordinating) {
        super.init(appCoordinating: appCoordinating)
        
        let carsService: CarsService = appCoordinating.serviceLocator.getService()
        listViewModel = CarsListViewModel(navigationEventHandler: self, carsService: carsService)
    }
    
}

// MARK: - NavigationEventHandling

extension CarListCoordinatorObject: NavigationEventHandling {
    func handleNavigationEvent(_ event: NavigationEvent) {
        if let event = event as? CarListNavigationEvent {
            switch event {
            case .showDetail(let car):
                detailViewModel = CarDetailViewModel(model: car, navigationEventHandler: self)
            }
        }
    }
}

