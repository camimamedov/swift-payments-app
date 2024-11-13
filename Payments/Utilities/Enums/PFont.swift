//
//  PFont.swift
//  Payments
//
//  Created by Cami Mamedov on 30.07.24.
//

import Foundation
import SwiftUI

enum PFont {
    enum Mulish: String{
        case Regular = "Mulish-Regular"
        case SemiBold = "Mulish-SemiBold"
        case Bold = "Mulish-Bold"
        
        func size(_ size: CGFloat) -> Font {
            return .custom(self.rawValue, size: size)
        }
    }
}
