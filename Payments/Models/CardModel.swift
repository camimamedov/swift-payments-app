//
//  CardModel.swift
//  Payments
//
//  Created by Cami Mamedov on 11.08.24.
//

import Foundation

struct CardModel: Identifiable {
    var id = UUID()
    var cardNumber: String
    var validThru: String
    var ownerName: String
    var cardType: CardType
    
    init(cardNumber: String, validThru: String, ownerName: String, cardType: CardType) {
        self.cardNumber = cardNumber
        self.validThru = validThru
        self.ownerName = ownerName
        self.cardType = cardType
    }
}
