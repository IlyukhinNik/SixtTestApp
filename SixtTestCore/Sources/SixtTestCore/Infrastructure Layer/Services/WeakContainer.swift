//
//  File.swift
//  
//
//  Created by Nikita Ilyukhin on 18.04.2022.
//

import Foundation

public final class WeakContainer<T: AnyObject> {
    
    public weak private(set) var value: T?
    
    public init(value: T) {
        self.value = value
    }

}

public extension Array where Element == WeakContainer<AnyObject> {
    
    var allValues: [AnyObject] {
        self.compactMap { $0.value }
    }
    
    mutating func appendWeakValue(_ value: AnyObject) {
        append(WeakContainer(value: value))
    }
    
    mutating func removeWeakValue(_ value: AnyObject) {
        let index = self.firstIndex { (element) -> Bool in
            if let value1 = element.value {
                return value1 === value
            }
            
            return false
        }
        
        if let index = index {
            remove(at: index)
        }
    }
    
    mutating func compact() {
        self = self.filter { $0.value != nil }
    }
    
}
