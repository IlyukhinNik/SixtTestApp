//
//  Group.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation

enum Group: String, Decodable {
    
    case bmw = "BMW"
    case mini = "MINI"
    
    var imageName: String {
        
        switch self {
        case .bmw:
            return IconName.Asset.Group.bmw
        case .mini:
            return IconName.Asset.Group.mini
        }
        
    }
    
}
