//
//  HomeView.swift
//  Payments
//
//  Created by Cami Mamedov on 19.05.24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack{
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
            
            NavigationView{
                PCardView()
            }
            .task {
                viewModel.getUserData()
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}

