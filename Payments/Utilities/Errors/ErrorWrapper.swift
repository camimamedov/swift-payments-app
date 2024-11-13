//
//  ErrorWrapper.swift
//  Payments
//
//  Created by Cami Mamedov on 12.11.24.
//

import SwiftUI

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: CustomError
}
