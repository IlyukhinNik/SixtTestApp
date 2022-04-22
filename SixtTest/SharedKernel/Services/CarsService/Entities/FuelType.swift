//
//  FuelType.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation

enum FuelType: String, Decodable {
    
    case diesel = "D"
    case petrol = "P"
    case electric = "E"
    
    var description: String {
        
        switch self {
        case .diesel:
            return Localizable.Car.FuelType.diesel
        case .petrol:
            return Localizable.Car.FuelType.petrol
        case .electric:
            return Localizable.Car.FuelType.electric
        }
        
    }
    
}
