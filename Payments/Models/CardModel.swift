//
//  CardModel.swift
//  Payments
//
//  Created by Cami Mamedov on 11.08.24.
//

import Foundation

struct CardModel: Identifiable {
    var id: UUID
    var cardNumber: String
    var validThru: String
    var ownerName: String
    var cardType: CardType
}
