//
//  CarsMapViewModel.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 19.04.2022.
//

import Foundation
import SixtTestCore
import Combine
import MapKit

final class CarMapViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published private(set) var state: State = .idle
    @Published var coordinateRegion = MKCoordinateRegion()
    
    // MARK: - Private properties
    
    private let carsService: CarsService
    private weak var navigationEventHandler: NavigationEventHandling?
    
    private var cancellables = Set<AnyCancellable>()
    private var annotationsCoordinateRegion = MKCoordinateRegion()
    
    // MARK: - Initialization
    
    init(navigationEventHandler: NavigationEventHandling? = nil, carsService: CarsService) {
        self.navigationEventHandler = navigationEventHandler
        self.carsService = carsService
        
        setupBindings()
    }
    
    // MARK: - Private methods
    
    private func setupBindings() {
        carsService.$cars
            .receive(on: RunLoop.main)
            .sink {
                let mapItemViewModels = $0.compactMap { CarMapItemViewModel(model: $0, navigationEventHandler: self.navigationEventHandler) }
                let coordinateRegion = MKCoordinateRegion(coordinates: mapItemViewModels.map { $0.coordinate } )
                
                self.coordinateRegion = coordinateRegion
                self.annotationsCoordinateRegion = coordinateRegion
                self.handleEvent(event: .onCarsLoaded(mapItemViewModels))
            }.store(in: &cancellables)
    }
    
    private func onAnnotationSelected(_ selected: CarMapItemViewModel, annotations: [CarMapItemViewModel]) {
        selected.handleEvent(event: .onSelect)
        
        for annotation in annotations {
            if annotation.id != selected.id {
                switch selected.state {
                case .selected:
                    annotation.handleEvent(event: .onHide)
                case .deselected, .hidden:
                    annotation.handleEvent(event: .onDeselect)
                }
            }
        }
        
        switch selected.state {
        case .selected:
            let span = MKCoordinateSpan(latitudeDelta: annotationsCoordinateRegion.span.latitudeDelta / 2.5,
                                        longitudeDelta: annotationsCoordinateRegion.span.longitudeDelta / 2.5)
            coordinateRegion = MKCoordinateRegion(center: selected.coordinate, span: span)
        default:
            coordinateRegion = annotationsCoordinateRegion
        }
    }
}

// MARK: - EventHandling

extension CarMapViewModel: EventHandling {
    
    typealias StateMachine = CarMapStateMachine
    
    enum State: Equatable {

        case idle
        case map(selectedAnnotation: CarMapItemViewModel?, annotations: [CarMapItemViewModel])

    }

    enum Event {

        case onSelectAnnotation(selectedAnnotation: CarMapItemViewModel, annotations: [CarMapItemViewModel])
        case onCarsLoaded([CarMapItemViewModel])
        case onShowDetails(CarMapItemViewModel)
    }
    
    // MARK: Public method
    
    func handleEvent(event: Event) {
        switch event {
        case .onSelectAnnotation(let selected, let annotations):
            onAnnotationSelected(selected, annotations: annotations)
        case .onShowDetails(let viewModel):
            navigationEventHandler?.handleNavigationEvent(CarMapNavigationEvent.showDetails(viewModel.model))
        default:
            break
        }
        
        state = StateMachine.reduce(state, event)
    }
    
}
