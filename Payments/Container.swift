//
//  Container.swift
//  Payments
//
//  Created by Cami Mamedov on 07.11.24.
//

import Factory

extension Container {
    
    var nerworkUtility: Factory<NetworkUtility> {
        Factory(self) { NetworkUtility() }
    }
    
    var cardDetailService: Factory<CardDetailService> {
        Factory(self) { CardDetailService() }
    }
}
