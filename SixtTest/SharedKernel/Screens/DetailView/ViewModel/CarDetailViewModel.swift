//
//  CarDetailViewModel.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 19.04.2022.
//

import Foundation
import SixtTestCore
import MapKit

/*
 Comment:
    CarDetailView using on both CarList and CarMap modules for detail presentation, so I decided
    to place files in SharedKernel of project,
 */

final class CarDetailViewModel: ObservableObject, Identifiable {
    
    // MARK: - Identifiable
    
    var id: String
    
    // MARK: - Public properties
    
    @Published var coordinateRegion: MKCoordinateRegion
    
    let car: Car
    let title: String
    let subtitle: String
    let imageUrl: URL?
    let annotationViewModel: CarMapItemViewModel
    let groupImageName: String
    let fuelInfo: AdditionalCarInfo
    let transmissionInfo: AdditionalCarInfo
    let innerCleanlinessInfo: AdditionalCarInfo
    let additionalInfoTitle: String = Localizable.Detail.additionalInfo
    
    // MARK: - Private properties
    
    private let navigationEventHandler: NavigationEventHandling?
    private let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    
    // MARK: - Initialization
    
    init(model: Car, navigationEventHandler: NavigationEventHandling?) {
        id = model.id
        car = model
        title = model.make + " " + model.modelName
        subtitle = model.licensePlate
        imageUrl = URL(string: model.carImageUrl)
        groupImageName = car.group.imageName
        annotationViewModel = .init(model: model, navigationEventHandler: nil)
        transmissionInfo = AdditionalCarInfo(title: "\(Localizable.Detail.transmission):",
                                             description: model.transmission.description)
        fuelInfo = AdditionalCarInfo(title: "\(Localizable.Detail.fuel):",
                                     description: model.fuelType.description)
        innerCleanlinessInfo = AdditionalCarInfo(title: "\(Localizable.Detail.innerCleanliness):",
                                                 description: model.innerCleanliness.description)
        coordinateRegion = MKCoordinateRegion(center: annotationViewModel.coordinate, span: span)
        
        self.navigationEventHandler = navigationEventHandler
    }

}
