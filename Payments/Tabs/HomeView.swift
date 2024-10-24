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
            NavigationView{
                VStack{
                    HStack{
                        Text("Good morning,")
                            .font(PFont.Mulish.SemiBold.size(11))
                            .multilineTextAlignment(.center)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack{
                            CardScrollView()
                            CardScrollView()
                        }
                        .scrollTargetLayout()
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .scrollTargetBehavior(.viewAligned)
                    .contentMargins(.horizontal, 50)
                    .defaultScrollAnchor(.leading)
                    
                    Spacer()
                }
                
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


struct CardScrollView: View {
    var body: some View {
        PCardView(cardNumber: "9328325421229875",
                  validThru: "12/29",
                  ownerName: "MAMMADOV CAMI",
                  cardType: .Visa)
        .scrollTransition { content, phase in
            content.scaleEffect(phase.isIdentity ? CGSize(width: 1, height: 1) :
                                    CGSize(width: 0.8, height: 0.8))
        }
    }
}
