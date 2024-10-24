//
//  StringExtension.swift
//  Payments
//
//  Created by Cami Mamedov on 04.08.24.
//

import Foundation

extension String
{
    func substring(from start: Int, to end: Int) -> String
    {
        let startIndex = self.startIndex
        let start = self.index(startIndex, offsetBy: start)
        let end = self.index(startIndex, offsetBy: end)
        let range = start..<end
        let substring = self[range]
        
        return String(substring)
    }
}
