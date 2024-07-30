//
//  AppColor.swift
//  Payments
//
//  Created by Cami Mamedov on 18.06.24.
//

import SwiftUI

enum PColor: String {
    case primary = "PrimaryColor"

    var color: Color {
        Color(self.rawValue)
    }
}
