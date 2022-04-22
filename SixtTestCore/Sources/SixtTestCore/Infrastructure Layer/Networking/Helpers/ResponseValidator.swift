//
//  ResponseValidator.swift
//  
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation


struct ResponseValidator {
    
    static func isValid(target: TargetType, response: HTTPURLResponse) throws {
        let acceptableStatusCodes = target.validationType.statusCodes
        
        guard !acceptableStatusCodes.isEmpty, !acceptableStatusCodes.contains(response.statusCode) else { return }
        
        let statusError = NetworkError.statusCode(response)
        let error = NetworkError.underlying(statusError, response)
        
        throw error
    }
    
}
