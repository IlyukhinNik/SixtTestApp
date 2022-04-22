//
//  CarMapItemViewModelTests.swift
//  SixtTestTests
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import XCTest
import SixtTestCore
@testable import SixtTest

class CarMapItemViewModelTests: XCTestCase {

    func testInitialState() {
        let testMapItemViewModel = CarMapItemViewModel(model: .testCar, navigationEventHandler: nil)
        let expectedState = CarMapItemViewModel.State.deselected
        
        XCTAssertEqual(testMapItemViewModel.state, expectedState, "Wrong init state: expect deselected state")
    }
    
    func testSelectedEventStates() {
        let testMapItemViewModel = CarMapItemViewModel(model: .testCar, navigationEventHandler: nil)
        let expectedFirstEventState = CarMapItemViewModel.State.selected //on first select event
        let expectedSecondEventState = CarMapItemViewModel.State.deselected //on second select event
        
        testMapItemViewModel.handleEvent(event: .onSelect)
        
        XCTAssertEqual(testMapItemViewModel.state, expectedFirstEventState, "Wrong state: expect selected state")
        
        testMapItemViewModel.handleEvent(event: .onSelect)
        
        XCTAssertEqual(testMapItemViewModel.state, expectedSecondEventState, "Wrong state: expect deselected state")
    }
    
    func testHideEventStates() {
        let testMapItemViewModel = CarMapItemViewModel(model: .testCar, navigationEventHandler: nil)
        let expectedState = CarMapItemViewModel.State.hidden
        
        testMapItemViewModel.handleEvent(event: .onHide)
        
        XCTAssertEqual(testMapItemViewModel.state, expectedState, "Wrong state: expect hide state")
    }

}
