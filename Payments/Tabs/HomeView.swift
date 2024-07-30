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
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .continuous)
                    .fill(PColor.primary.color)
                    .frame(width: 283, height: 176)
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
