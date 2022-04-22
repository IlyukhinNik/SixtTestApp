//
//  File.swift
//  
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation

/*
 Comment:
    This is realization of Service Locator pattern.
    It`s very useful for modular application, because it helps to avoid dependencies
*/

public final class ServiceLocator {
    
    private var registry: [String: WeakContainer<AnyObject>] = [:]
    
    public init() {}
    
    public func registerService<T: AnyObject>(_ service: T) {
        let key = "\(T.self)"
        registry[key] = WeakContainer(value: service)
    }
    
    public func tryGetService<T>() -> T? {
        let key = "\(T.self)"
        let container = registry[key]
        
        return container?.value as? T
    }
    
    public func getService<T>() -> T {
        let key = "\(T.self)"
        let container = registry[key]
        
        return container!.value as! T
    }
    
}
