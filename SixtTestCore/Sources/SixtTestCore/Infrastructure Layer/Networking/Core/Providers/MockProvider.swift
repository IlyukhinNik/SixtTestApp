//
//  File.swift
//  
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation

@available(iOS 15.0, *)
/// Mocked request provider class.
open class MockProvider<Target: TargetType>: NetworkProvider<Target> {
    
    public override func request<T: Decodable>(_ target: Target, decoder: JSONDecoder = .defaultKeys) async throws -> T {
        let endpoint = endpointMapper.map(target)
        
        switch endpoint.sampleResponse {
        case .networkResponse(let code, let data):
            guard target.validationType.statusCodes.contains(code) else { throw NetworkError.statusCode(HTTPURLResponse()) }
            
            guard let decodedResponse = try? decoder.decode(T.self, from: data) else {
                throw NetworkError.objectMapping(HTTPURLResponse())
            }
            
            return decodedResponse
        case .networkError(let error):
            throw error
        case .response(let response, let data):
            try ResponseValidator.isValid(target: target, response: response)
            
            guard let decodedResponse = try? decoder.decode(T.self, from: data) else {
                throw NetworkError.objectMapping(response)
            }
            
            return decodedResponse
        }
    }
    
    
//
//    public override func request<T: Decodable>(_ target: Target, decoder: JSONDecoder = .defaultKeys) async throws -> T {
//
//        guard let decodedResponse = try? decoder.decode(T.self, from: target.sampleData) else {
//            throw NetworkError.objectMapping(HTTPURLResponse())
//        }
//
//        return decodedResponse
//    }

}

