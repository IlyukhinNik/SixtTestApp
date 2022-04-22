//
//  CarMapCoordinatorObjectTests.swift
//  SixtTestTests
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import XCTest
import SixtTestCore
@testable import SixtTest

class CarMapCoordinatorObjectTests: XCTestCase {

    func testInitialState() {
        let appCoordinatingService: AppCoordinating = TestAppCoordinationService()
        let coordinatorObject = CarMapCoordinatorObject(appCoordinating: appCoordinatingService)
        
        XCTAssertNotNil(coordinatorObject.mapViewModel, "Wrong init state: listViewModel must be initialized")
        XCTAssertNil(coordinatorObject.detailViewModel, "Wrong init state: detailViewModel must be nil")
    }
    
    func testShowDetailEventHandling() {
        let appCoordinatingService: AppCoordinating = TestAppCoordinationService()
        let coordinatorObject = CarMapCoordinatorObject(appCoordinating: appCoordinatingService)
        
        coordinatorObject.handleNavigationEvent(CarMapNavigationEvent.showDetails(.testCar))
        
        Task {
            try await Task.sleep(nanoseconds: 10)
            
            XCTAssertNotNil(coordinatorObject.mapViewModel, "Wrong init state: listViewModel must be initialized")
            XCTAssertNotNil(coordinatorObject.detailViewModel, "Wrong init state: detailViewModel must be initialized")
        }
    }

}
