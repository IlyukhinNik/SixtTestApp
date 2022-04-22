//
//  File.swift
//  
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation

public extension JSONDecoder {
    
    static var convertFromSnakeCase: JSONDecoder {
        .decoder(keyDecodingStrategy: .convertFromSnakeCase,
                 dateDecodingStrategy: .millisecondsSince1970)
    }
    
    static var defaultKeys: JSONDecoder {
        .decoder(keyDecodingStrategy: .useDefaultKeys,
                 dateDecodingStrategy: .millisecondsSince1970)
    }
    
    static func decoder(keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy,
                        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy) -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = keyDecodingStrategy
        decoder.dateDecodingStrategy = dateDecodingStrategy
        
        return decoder
    }
}
