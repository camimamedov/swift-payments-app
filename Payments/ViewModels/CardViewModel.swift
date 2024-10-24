//
//  CardViewModel.swift
//  Payments
//
//  Created by Cami Mamedov on 11.08.24.
//

import Foundation

class CardViewModel: ObservableObject {
    @Published var cards: [CardModel] = []
}
