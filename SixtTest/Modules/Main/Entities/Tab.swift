//
//  Tab.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 19.04.2022.
//

import Foundation

enum Tab: Hashable {
    
    case map
    case list
    
    var title: String {
        
        switch self {
        case .map:
            return Localizable.Tab.map
        case .list:
            return Localizable.Tab.list
        }
        
    }
    
    var imageName: String {
        
        switch self {
        case .map:
            return "list.bullet"
        case .list:
            return "map.fill"
        }
        
    }
    
}
