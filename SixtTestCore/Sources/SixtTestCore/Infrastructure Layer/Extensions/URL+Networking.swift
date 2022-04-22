//
//  File.swift
//  
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation

public extension URL {

    /// Initialize URL from Networking's `TargetType`.
    init<T: TargetType>(target: T) {
        if target.path.isEmpty {
            self = target.baseURL
        } else {
            self = target.baseURL.appendingPathComponent(target.path)
        }
    }
}
