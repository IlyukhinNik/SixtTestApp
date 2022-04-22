//
//  NetworkError.swift
//  
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation
import SwiftUI

/// A type representing possible errors can throw.
public enum NetworkError: Error {

    /// Indicates that an `Endpoint` failed to map to a `URLRequest`.
    case requestMapping(String)
    
    /// Indicates that Encodable couldn't be encoded into Data
    case encodableMapping(Error)
    
    /// Indicates that an `Endpoint` failed to encode the parameters for the `URLRequest`.
    case parameterEncoding(Error)
    
    /// Indicates a response failed with an invalid HTTP status code.
    case statusCode(HTTPURLResponse)

    /// Indicates a response failed due to an underlying `Error`.
    case underlying(Error, HTTPURLResponse?)
    
    /// Indicates a response failed to map to a Decodable object.
    case objectMapping(HTTPURLResponse)
    
    /// Indicates a response failed to map to a `HTTPURLResponse`.
    case noResponse

}

// MARK: - Error Descriptions

extension NetworkError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .objectMapping:
            return "networkError.objectMapping".localized(bundle: .module)
        case .encodableMapping:
            return "networkError.encodableMapping".localized(bundle: .module)
        case .statusCode:
            return "networkError.statusCode".localized(bundle: .module)
        case .underlying(let error, _):
            return error.localizedDescription
        case .requestMapping:
            return "networkError.requestMapping".localized(bundle: .module)
        case .parameterEncoding(let error):
            return String(format: "networkError.parameterEncoding".localized(bundle: .module), error.localizedDescription)
        case .noResponse:
            return "networkError.noResponse".localized(bundle: .module)
        }
    }
    
}
