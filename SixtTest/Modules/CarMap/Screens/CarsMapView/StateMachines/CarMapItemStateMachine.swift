//
//  CarMapItemStateMachine.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation
import SixtTestCore

struct CarMapItemStateMachine: StateMachine {
    
    typealias MachineModel = CarMapItemViewModel
    
    static func reduce(_ state: MachineModel.State, _ event: MachineModel.Event) -> MachineModel.State {
        switch state {
        case .selected:
            switch event {
            case .onSelect, .onDeselect:
                return .deselected
            case .onHide:
                return .hidden
            default:
                return state
            }
        default:
            switch event {
            case .onSelect:
                return .selected
            case .onDeselect:
                return .deselected
            case .onHide:
                return .hidden
            default:
                return state
            }
        }
    }
    
}
