//
//  CarListItemViewModel.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 19.04.2022.
//

import Foundation

struct CarsListItemViewModel: Identifiable {
    
    // MARK: - Identifiable
    
    var id: String
    
    // MARK: - Public properties
    
    let car: Car
    let title: String
    let subtitle: String
    let imageUrl: URL?
    
    // MARK: - Initialization
    
    init(model: Car) {
        id = model.id
        car = model
        title = model.modelName
        subtitle = "\(Localizable.Detail.transmission): \(model.transmission.description)"
        imageUrl = URL(string: model.carImageUrl)
        
        
    }
    
}
