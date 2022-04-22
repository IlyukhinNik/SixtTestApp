//
//  CarMapViewModelTests.swift
//  SixtTestTests
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import XCTest

import SixtTestCore
@testable import SixtTest

class CarMapViewModelTests: XCTestCase {

    func testInitialState() {
        let coordinationService = TestAppCoordinationService()
        let testMapViewModel = CarMapViewModel(carsService: coordinationService.serviceLocator.getService())
        let expectedState = CarMapViewModel.State.idle
        
        XCTAssertEqual(testMapViewModel.state, expectedState, "Wrong init state: expect idle state")
    }
    
    func testOnCarsLoadedEventState() {
        let coordinationService = TestAppCoordinationService()
        let testMapViewModel = CarMapViewModel(carsService: coordinationService.serviceLocator.getService())
        
        testMapViewModel.handleEvent(event: .onCarsLoaded([CarMapItemViewModel(model: .testCar, navigationEventHandler: nil)]))
        
        switch testMapViewModel.state {
        case .map(let selectedAnnotation, _):
            XCTAssertNil(selectedAnnotation , "Wrong state: on load cars expect selectedAnnotation nil")
        case .idle:
            XCTExpectFailure("Wrong state: expect carsLoaded state")
        }
    }
    
    func testOnSelectCarEventState() {
        let testMapItemViewModel = CarMapItemViewModel(model: .testCar, navigationEventHandler: nil)
        let coordinationService = TestAppCoordinationService()
        let testMapViewModel = CarMapViewModel(carsService: coordinationService.serviceLocator.getService())
        
        testMapViewModel.handleEvent(event: .onSelectAnnotation(selectedAnnotation: testMapItemViewModel,
                                                                annotations: [testMapItemViewModel]))
        
        switch testMapViewModel.state {
        case .map(let selectedAnnotation, _):
            XCTAssertNotNil(selectedAnnotation , "Wrong state: on select annotatation expect selectedAnnotation model value, not nil")
        case .idle:
            XCTExpectFailure("Wrong state: expect carsLoaded state")
        }
    }

}
