//
//  TabBarCoordinatorObjectTests.swift
//  SixtTestTests
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import XCTest
import SixtTestCore
@testable import SixtTest

class TabBarCoordinatorObjectTests: XCTestCase {
    
    func testInitialState() {
        let appCoordinatingService: AppCoordinating = TestAppCoordinationService()
        let coordinatorObject = TabBarCoordinatorObject(appCoordinating: appCoordinatingService)
        let expectedState: TabBarCoordinatorObject.State = .idle
        
        XCTAssertTrue(coordinatorObject.state == expectedState, "Wrong initial state: expect idle")
    }
    
    func testSuccesLoadingCoordinatorObjectState() {
        let appCoordinatingService: AppCoordinating = TestAppCoordinationService()
        let coordinatorObject = TabBarCoordinatorObject(appCoordinating: appCoordinatingService)
        let expectedState: TabBarCoordinatorObject.State = .loaded
        Task {
            await coordinatorObject.loadData()
            XCTAssertTrue(coordinatorObject.state == expectedState, "Wrong state on success loaded data.")
        }

    }
    
    func testErrorLoadingCoordinatorObjectState() {
        let appCoordinatingService: AppCoordinating = TestAppCoordinationService(networkProvider: MockProvider<CarsClient>(endpointMapper: TargetToEndpointErrorMapper()))
        let coordinatorObject = TabBarCoordinatorObject(appCoordinating: appCoordinatingService)
        let expectedState: TabBarCoordinatorObject.State = .loadError(NetworkError.noResponse)
        Task {
            await coordinatorObject.loadData()
            XCTAssertTrue(coordinatorObject.state == expectedState, "Wrong state on success loaded data.")
        }

    }


}
