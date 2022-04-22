//
//  Coordinator.swift
//  
//
//  Created by Nikita Ilyukhin on 19.04.2022.
//

import Foundation
import SwiftUI

/*
    Comment:
        I didn't use Singleton in project and use just one instance of `ServiceLocator`, which passed from coordinator to coordinator. So, coordinators can fetch needed services from serviceLocator and be free from dependencies of unused services.
 */

@available(iOS 13.0, *)
///Base class for all coordinators of application
open class CoordinatorObject {
    
    public var appCoordinating: AppCoordinating
    
    public init(appCoordinating: AppCoordinating) {
        self.appCoordinating = appCoordinating
    }
}
