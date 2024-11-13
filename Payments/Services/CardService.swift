//
//  CardDetailsService.swift
//  Payments
//
//  Created by Cami Mamedov on 07.11.24.
//

import Factory
import SwiftUI

@MainActor class CardService : ObservableObject{
    
    @Published var cards: [CardModel] = []
    
    init(){
        cards.append(CardModel(cardNumber: "1111111111111111", validThru: "12/22", ownerName: "Cami", cardType: .MasterCard))
        cards.append(CardModel(cardNumber: "2222222222222222", validThru: "12/22", ownerName: "Cami", cardType: .MasterCard))
    }
    
    func fetchCards() {
    }
    
    func selectCard(){
        
    }
    
    func addCard(){
        print("Adding Card")
        cards.append(CardModel(cardNumber: "3333333333333333", validThru: "12/22", ownerName: "Cami", cardType: .MasterCard))
        print("Card Added: \(cards.count)")
    }
}
