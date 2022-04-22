//
//  InnerCleanliness.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation

enum InnerCleanliness: String, Decodable {
    
    case clean = "CLEAN"
    case veryClean = "VERY_CLEAN"
    case regular = "REGULAR"
    
    var description: String {
        
        switch self {
        case .clean:
            return Localizable.Car.InnerCleanliness.clean
        case .veryClean:
            return Localizable.Car.InnerCleanliness.veryClean
        case .regular:
            return Localizable.Car.InnerCleanliness.regular
        }
        
    }
    
}
