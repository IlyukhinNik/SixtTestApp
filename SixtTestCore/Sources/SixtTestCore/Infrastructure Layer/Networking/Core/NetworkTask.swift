//
//  NetworkTask.swift
//  
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation

/// Represents an HTTP task.
public enum NetworkTask {

    /// A request with no additional data.
    case requestPlain

    /// A requests body set with data.
    case requestData(Data)

    /// A request body set with `Encodable` type
    case requestJSONEncodable(Encodable)

    /// A request body set with `Encodable` type and custom encoder
    case requestCustomJSONEncodable(Encodable, encoder: JSONEncoder)
    
}

