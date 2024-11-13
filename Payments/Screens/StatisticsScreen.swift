//
//  StatisticsView.swift
//  Payments
//
//  Created by Cami Mamedov on 19.05.24.
//

import SwiftUI

struct StatisticsScreen: View {
    
    @EnvironmentObject private var errorState: ErrorState
    
    var body: some View {
        ZStack{
            PColor.background.color
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("StatisticsView")
            }
        }
        .onAppear {
            errorState.error = NetworkError.noData
        }
    }
}

#Preview {
    StatisticsScreen()
}
