//
//  CardDetailsService.swift
//  Payments
//
//  Created by Cami Mamedov on 07.11.24.
//

import Factory

class CardDetailService{
    @Injected(\.nerworkUtility) private var networkUtility
    
    func getCardDetails() {
        networkUtility.perform()
    }
}
