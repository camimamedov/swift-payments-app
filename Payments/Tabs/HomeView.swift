//
//  HomeView.swift
//  Payments
//
//  Created by Cami Mamedov on 19.05.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
            VStack{
                Text("HomeView")
                    .frame(height: 1000)
                    .background(Color.red)
            }
        }
    }
}

#Preview {
    HomeView()
}
