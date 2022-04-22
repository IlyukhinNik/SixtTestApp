//
//  Transmission.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation

enum Transmission: String, Decodable {
    
    case manual = "M"
    case automatic = "A"
    
    var description: String {
        
        switch self {
        case .manual:
            return Localizable.Car.Transmission.manual
        case .automatic:
            return Localizable.Car.Transmission.automatic
        }
        
    }
    
}
