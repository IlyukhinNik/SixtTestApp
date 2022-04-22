//
//  EndpointMapper.swift
//  
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation

public protocol EndpointMapper {

    func map<T: TargetType>(_ target: T) -> Endpoint
    
}

public final class TargetToEndpointMapper: EndpointMapper {
    
    public init() {}

    public func map<T: TargetType>(_ target: T) -> Endpoint {
        Endpoint(url: URL(target: target).absoluteString,
                 method: target.method,
                 task: target.task,
                 sampleResponse: .networkResponse(200, target.sampleData),
                 httpHeaders: target.headers)
    }
    
}

public final class TargetToEndpointErrorMapper: EndpointMapper {
    
    public init() {}

    public func map<T: TargetType>(_ target: T) -> Endpoint {
        Endpoint(url: URL(target: target).absoluteString,
                 method: target.method,
                 task: target.task,
                 sampleResponse: .networkError(.noResponse),
                 httpHeaders: target.headers)
    }
    
}
