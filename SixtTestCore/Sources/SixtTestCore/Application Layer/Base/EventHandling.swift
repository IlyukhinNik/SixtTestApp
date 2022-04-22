//
//  File.swift
//  
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation

public protocol EventHandling {
    
    associatedtype Event
    associatedtype State

    func handleEvent(event: Event)
    
}
