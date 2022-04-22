//
//  File.swift
//  
//
//  Created by Nikita Ilyukhin on 21.04.2022.
//

import Foundation

public protocol StateMachine {
    associatedtype MachineModel: EventHandling

    static func reduce(_ state: MachineModel.State, _ event: MachineModel.Event) -> MachineModel.State
}
