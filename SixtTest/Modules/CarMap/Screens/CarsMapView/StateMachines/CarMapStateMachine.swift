//
//  CarMapStateMachine.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation
import SixtTestCore

struct CarMapStateMachine: StateMachine {
    
    typealias MachineModel = CarMapViewModel
    
    static func reduce(_ state: MachineModel.State, _ event: MachineModel.Event) -> MachineModel.State {
        switch event {
        case .onCarsLoaded(let cars):
            return .map(selectedAnnotation: nil, annotations: cars)
        case .onSelectAnnotation(let selected, let annotations):
            return .map(selectedAnnotation: selected.state == .selected ? selected : nil, annotations: annotations)
        default:
            return state
        }
    }
    
}
