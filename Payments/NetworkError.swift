//
//  NetworkError.swift
//  Payments
//
//  Created by Cami Mamedov on 20.05.24.
//

import Foundation

enum NetworkError: String, Error
{
    case invalidUrl = "URL is invalid"
    case noData = "Something went wrong"
    case invalidData = "We get invalid data"
}
