//
//  Localizable.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation

enum Localizable {
    
    enum Tab {
        
        static let map = "tab.map".localized()
        static let list = "tab.list".localized()
        
    }
    
    enum Button {
        
        static let reload = "button.reload".localized()
        static let showDetails = "button.showDetails".localized()
        
    }
    
    enum Detail {
        
        static let transmission = "detail.transmission".localized()
        static let fuel = "detail.fuel".localized()
        static let innerCleanliness = "detail.innerCleanliness".localized()
        static let additionalInfo = "detail.additionalInfo".localized()
        
        
    }
    
    enum Car {
        
        enum Transmission {
            
            static let automatic = "transmission.automatic" .localized()
            static let manual = "transmission.manual".localized()
            
        }
        
        enum FuelType {
            
            static let diesel = "fuelType.diesel".localized()
            static let petrol = "fuelType.petrol".localized()
            static let electric = "fuelType.electric".localized()
            
        }
        
        enum InnerCleanliness {
            
            static let clean = "innerCleanliness.clean".localized()
            static let veryClean = "innerCleanliness.veryClean".localized()
            static let regular = "innerCleanliness.regular".localized()
            
        }
        
    }
    
}
