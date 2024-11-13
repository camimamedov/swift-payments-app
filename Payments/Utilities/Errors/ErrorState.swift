//
//  ErrorWrapper.swift
//  Payments
//
//  Created by Cami Mamedov on 11.11.24.
//

import Foundation

class ErrorState: ObservableObject {
    @Published var error: CustomError?
}
