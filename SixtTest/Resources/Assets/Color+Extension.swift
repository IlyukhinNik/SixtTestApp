//
//  SixtColor.swift
//  SixtTest
//
//  Created by Nikita Ilyukhin on 20.04.2022.
//

import Foundation
import SwiftUI

extension UIColor {
    
    static func named(_ name: String) -> UIColor {
        UIColor.init(named: name) ?? UIColor()
    }
    
    static var main: UIColor { .named("main") }
    static var background: UIColor { .named("background") }
    static var textColor: UIColor { .named("text") }
    static var textSecondaryColor: UIColor { .named("textSecondary") }
    
}

extension Color {
    
    static var main: Color { Color(.main) }
    static var background: Color { Color(.background) }
    static var textColor: Color { Color(.textColor) }
    static var textSecondaryColor: Color { Color(.textSecondaryColor) }
    
}
