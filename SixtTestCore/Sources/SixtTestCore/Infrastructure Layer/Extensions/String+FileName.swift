//
//  File.swift
//  
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation

public extension String {
    
    func fileToData() -> Data {
        let parts = components(separatedBy: ".")
        let name = parts[0]
        let ext = parts[1]
        guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
            fatalError("Wrong Bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else { fatalError("Failed to create data from url") }
        
        return data
    }
    
}
