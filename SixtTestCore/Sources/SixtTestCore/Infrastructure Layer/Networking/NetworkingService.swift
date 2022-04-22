//
//  File.swift
//  
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation

@available(iOS 15.0, *)
public final class NetworkingService<T: TargetType> {
    
    private let provider: NetworkProvider<T>
        
    public init(provider: NetworkProvider<T>) {
        self.provider = provider
    }
    
    public convenience init(endpointMapper: EndpointMapper = TargetToEndpointMapper(), isMocked: Bool = false) {
        self.init(provider: isMocked ? MockProvider<T>(endpointMapper: endpointMapper) : NetworkProvider<T>(endpointMapper: endpointMapper))
    }
    
    public func requestDecodable<D: Decodable>(_ target: T, decoder: JSONDecoder = .defaultKeys) async throws -> D {
        try await provider.request(target, decoder: decoder)
    }
}
