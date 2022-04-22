//
//  ServiceLocatorTests.swift
//  
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import XCTest
@testable import SixtTestCore

class ServiceLocatorTests: XCTestCase {

    func registerServiceTest() {
        let serviceLocator = ServiceLocator()
        let networkingService = NetworkingService()
        serviceLocator.registerService(networkingService)
        
        let registeredService: NetworkingService = serviceLocator.getService()
        
        XCTAssertEqual(networkingService, registeredService, "Wrong value: expect registered value")
    }
    
    func tryGetServiceTest() {
        let serviceLocator = ServiceLocator()
        let networkingService = NetworkingService()
        serviceLocator.registerService(networkingService)
        
        let registeredService: NetworkingService = serviceLocator.getService()
        let unregisteredService: ResponseValidator = serviceLocator.tryGetService()
        
        XCTAssertNotNil(gotNetworkingService, "Wrong value: expect registered value")
        XCTAssertNil(unregisteredService, "Wrong value: expect nil value")
    }

}
