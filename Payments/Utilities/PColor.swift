//
//  AppColor.swift
//  Payments
//
//  Created by Cami Mamedov on 18.06.24.
//

import SwiftUI

enum PColor: String {
    case primary = "PrimaryColor"
    case black1 = "Black1"

    var color: Color {
        Color(self.rawValue)
    }
}
