//
//  NetworkError.swift
//  Payments
//
//  Created by Cami Mamedov on 20.05.24.
//

import Foundation

enum NetworkError: CustomError
{
    case invalidUrl
    case invalidData
    case noData
    
    var description: String {
        switch self {
        case .invalidUrl:
            return "URL is invalid"
        case .invalidData:
            return "We get invalid data"
        case .noData:
            return "Something went wrong"
        }
    }
}
