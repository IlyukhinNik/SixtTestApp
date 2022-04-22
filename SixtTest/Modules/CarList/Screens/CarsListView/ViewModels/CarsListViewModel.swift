//
//  CarsListViewModel.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 19.04.2022.
//

import Foundation
import SixtTestCore
import Combine

final class CarsListViewModel: ObservableObject, Identifiable {
    
    // MARK: - Public properties
    
    @Published private(set) var state: State = .idle
    
    // MARK: - Private properties
    
    private let carsService: CarsService
    private weak var navigationEventHandler: NavigationEventHandling?
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    
    init(navigationEventHandler: NavigationEventHandling? = nil, carsService: CarsService) {
        self.navigationEventHandler = navigationEventHandler
        self.carsService = carsService
        
        setupBindings()
    }
    
    // MARK: - Public methods
    
    func refreshData() async {
            do {
                try await carsService.reloadData()
            } catch {}
    }
    
    // MARK: - Private methods
    
    private func setupBindings() {
        carsService.$cars
            .dropFirst()
            .receive(on: RunLoop.main)
            .sink {
                self.handleEvent(event: .onCarsLoaded($0.compactMap { CarsListItemViewModel(model: $0) }))
            }.store(in: &cancellables)
    }
}

// MARK: - EventHandling

extension CarsListViewModel: EventHandling {
        
    enum State {
        
        case idle
        case list([CarsListItemViewModel])
        
    }

    enum Event {
        
        case onCarsLoaded([CarsListItemViewModel])
        case onSelectCar(CarsListItemViewModel)
        
    }
    
    func handleEvent(event: Event) {
        switch event {
        case .onCarsLoaded(let cars):
            state = .list(cars)
        case .onSelectCar(let item):
            navigationEventHandler?.handleNavigationEvent(CarListNavigationEvent.showDetail(item.car))
        }
        
        state = CarsListStateMachine.reduce(state, event)
    }
    
}
