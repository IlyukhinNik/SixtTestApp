//
//  TabBarCoordinatorObject.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation
import Combine
import SwiftUI
import SixtTestCore

/*
    Comment:
       Load data and handling errors realized here, showing list and map presentation only, if retrieved some correct data, in another cases it doesn't have a matter
 */

final class TabBarCoordinatorObject: CoordinatorObject, ObservableObject {
    
    enum State: Equatable {
        
        case idle
        case loading
        case loaded
        case loadError(Error)
        
        static func ==(lhs: State, rhs: State) -> Bool {
            
            switch (lhs,rhs) {
            case (.idle, .idle), (.loaded, .loaded), (loading, loading):
                return true
            case (.loadError(let lhsError), loadError(let rhsError)):
                return lhsError.localizedDescription == rhsError.localizedDescription
            default:
                return false
            }
            
        }
    }
    
    // MARK: - Public properties
    
    @Published var state: State = .idle
    @Published var tab: Tab = .list
    @Published var carMapCoordinatorObject: CarMapCoordinatorObject!
    @Published var carListCoordinatorObject: CarListCoordinatorObject!
    
    // MARK: - Private properties
    private let carsService: CarsService
    
    // MARK: - Initialization
    
    override init(appCoordinating: AppCoordinating) {
        carMapCoordinatorObject = CarMapCoordinatorObject(appCoordinating: appCoordinating)
        carListCoordinatorObject = CarListCoordinatorObject(appCoordinating: appCoordinating)
        carsService = appCoordinating.serviceLocator.getService()
        
        super.init(appCoordinating: appCoordinating)
    }
    
    // MARK: - Public methods
    
    func loadData() async {
        updateState(with: .loading)
        do {
            try await carsService.reloadData()
            updateState(with: .loaded)
        } catch {
            updateState(with: .loadError(error))
        }
    }
    
    // MARK: - Private methods
    
    private func updateState(with newState: State) {
        state = newState
    }
}
