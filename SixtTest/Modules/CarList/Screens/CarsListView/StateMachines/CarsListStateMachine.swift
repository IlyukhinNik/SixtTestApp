//
//  CarsListStateMachine.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation
import SixtTestCore

struct CarsListStateMachine: StateMachine {
    
    typealias MachineModel = CarsListViewModel
    
    static func reduce(_ state: CarsListViewModel.State, _ event: CarsListViewModel.Event) -> CarsListViewModel.State {
        switch state {
        case .idle, .list:
            switch event {
            case .onCarsLoaded(let items):
                return .list(items)
            default:
                return state
            }
        }
    }
    
}
