//
//  NavigationEventHandling.swift
//  
//
//  Created by Nikita Ilyukhin on 19.04.2022.
//

import Foundation

/*
    Comment:
        To hide dependencies between `Coordinator` and `ViewModel` I decided to use abstraction `NavigationEventHandling` to received `NavigationEvent` by `Coordinator`
 */

///Base protocol for navigation events
public protocol NavigationEvent { }

///Base protocol for navigation events handler
public protocol NavigationEventHandling: AnyObject {
    
    func handleNavigationEvent(_ event: NavigationEvent)
    
}
