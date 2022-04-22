//
//  NetworkProvider.swift
//  
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation

@available(iOS 15.0, *)
/// A protocol representing a minimal interface for a NetworkProvider.
/// Used by the reactive provider extensions.
public protocol NetworkProviding: AnyObject {

    associatedtype Target: TargetType

    /// Designated request-making method.
    func request<T: Decodable>(_ target: Target, decoder: JSONDecoder) async throws -> T
    
}

@available(iOS 15.0, *)
/// Request provider class. Requests should be made through this class only.
open class NetworkProvider<Target: TargetType>: NetworkProviding {
    
    let endpointMapper: EndpointMapper
    
    public init(endpointMapper: EndpointMapper = TargetToEndpointMapper()) {
        self.endpointMapper = endpointMapper
    }
    
    public func request<T: Decodable>(_ target: Target, decoder: JSONDecoder = .defaultKeys) async throws -> T {
        let endpoint = endpointMapper.map(target)
        
        let request = try endpoint.asURLRequest()
        let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.noResponse
        }
        
        try ResponseValidator.isValid(target: target, response: response)
        
        guard let decodedResponse = try? decoder.decode(T.self, from: data) else {
            throw NetworkError.objectMapping(response)
        }
        
        return decodedResponse
    }

}
