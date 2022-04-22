//
//  Endpoint.swift
//  
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation

/// Used for stubbing responses.
public enum EndpointSampleResponse {

    /// The network returned a response, including status code and data.
    case networkResponse(Int, Data)

    /// The network returned response which can be fully customized.
    case response(HTTPURLResponse, Data)

    /// The network failed to send the request, or failed to retrieve a response (eg a timeout).
    case networkError(NetworkError)
}

/// Class for reifying a target of the `Target` enum unto a concrete `Endpoint`.
open class Endpoint {
    
    /// A string representation of the URL for the request.
    public let url: String

    /// The HTTP method for the request.
    public let method: HTTPMethod
    
    /// Sample data of request, use for stub.
    public let sampleResponse: EndpointSampleResponse

    /// The `Task` for the request.
    public let task: NetworkTask
    
    /// The HTTP header fields for the request.
    public let httpHeaders: [String: String]?
    
    init(url: String, method: HTTPMethod, task: NetworkTask, sampleResponse: EndpointSampleResponse, httpHeaders: [String: String]? = nil) {
        self.url = url
        self.method = method
        self.task = task
        self.sampleResponse = sampleResponse
        self.httpHeaders = httpHeaders
    }
    
}

extension Endpoint: URLRequestConvertible {
    
    public func asURLRequest() throws -> URLRequest {
        guard let requestURL = Foundation.URL(string: url) else {
            throw NetworkError.requestMapping(url)
        }

        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = httpHeaders
        
        switch task {
        case .requestPlain:
            return request
        case .requestData(let data):
            request.httpBody = data
            return request
        case let .requestJSONEncodable(encodable):
            return try request.encoded(encodable: encodable)
        case let .requestCustomJSONEncodable(encodable, encoder: encoder):
            return try request.encoded(encodable: encodable, encoder: encoder)
        }
    }
    
}
