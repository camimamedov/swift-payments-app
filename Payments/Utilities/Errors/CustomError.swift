//
//  CustomError.swift
//  Payments
//
//  Created by Cami Mamedov on 11.11.24.
//

import Foundation

protocol CustomError: Error
{
    var description: String { get }
}

enum DefaultError: CustomError{
    case error
    var description: String { return "no error" }
}
