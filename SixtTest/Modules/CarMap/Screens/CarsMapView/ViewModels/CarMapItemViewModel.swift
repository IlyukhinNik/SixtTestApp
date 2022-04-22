//
//  CarMapAnnotationViewModel.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 20.04.2022.
//

import Foundation
import CoreLocation
import SixtTestCore

typealias AdditionalCarInfo = (title: String, description: String)

final class CarMapItemViewModel: ObservableObject, Identifiable {
    
    // MARK: - Identifiable
    
    var id: String
    
    // MARK: - Public properties
    
    @Published private(set) var state: State = .deselected
    
    let model: Car
    let title: String
    let subtitle: String
    let fuelInfo: AdditionalCarInfo
    let transmissionInfo: AdditionalCarInfo
    let detailsButtonTitle: String = Localizable.Button.showDetails
    
    let imageUrl: URL?
    let coordinate: CLLocationCoordinate2D
    let groupImageName: String
    
    // MARK: - Private properties
    
    private let navigationEventHandler: NavigationEventHandling?
    
    // MARK: - Initialization
    
    init(model: Car, navigationEventHandler: NavigationEventHandling?) {
        self.model = model
        id = model.id
        title = model.make + " " + model.modelName
        subtitle = model.licensePlate
        imageUrl = URL(string: model.carImageUrl)
        groupImageName = model.group.imageName
        coordinate = CLLocationCoordinate2D(latitude: model.latitude, longitude: model.longitude)
        fuelInfo = AdditionalCarInfo(title: Localizable.Detail.fuel,
                                     description: model.fuelType.description)
        transmissionInfo = AdditionalCarInfo(title: Localizable.Detail.transmission, description: model.transmission.description)
        
        self.navigationEventHandler = navigationEventHandler
    }

}

// MARK: - EventHandling

extension CarMapItemViewModel: EventHandling {
    
    enum State {

        case deselected
        case selected
        case hidden

    }

    enum Event {

        case onSelect
        case onDeselect
        case onHide
        case onShowDetails

    }
    
    // MARK: Public methods
    
    func handleEvent(event: Event) {
        switch event {
        case .onShowDetails:
            navigationEventHandler?.handleNavigationEvent(CarMapNavigationEvent.showDetails(model))
        default:
            break
        }
        state = CarMapItemStateMachine.reduce(state, event)
    }
    
}

// MARK: - Equatable

extension CarMapItemViewModel: Equatable {
    
    static func == (lhs: CarMapItemViewModel, rhs: CarMapItemViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
}
