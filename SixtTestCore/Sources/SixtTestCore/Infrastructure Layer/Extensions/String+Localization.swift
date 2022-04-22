//
//  File.swift
//  
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation

public extension String {
    
    func localized(bundle: Bundle = .main) -> String {
        NSLocalizedString(self, bundle: bundle, comment: "")
    }
    
}
