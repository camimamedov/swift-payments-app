//
//  HomeView.swift
//  Payments
//
//  Created by Cami Mamedov on 19.05.24.
//

import SwiftUI
import Factory

struct HomeView: View {
    
    @Injected(\.cardDetailService) private var cardDetailService
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack{
            NavigationView{
                VStack (alignment: .leading){
                    
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Welcome,")
                                .font(PFont.Mulish.Regular.size(11))
                            .multilineTextAlignment(.center)
                            
                            Text("Cami Mammadov")
                                .font(PFont.Mulish.SemiBold.size(20))
                                .foregroundStyle(PColor.primary.color)
                            .multilineTextAlignment(.center)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay {
                                Circle().stroke(lineWidth: 1)
                            }
                            .shadow(radius: 5)
                        
                        Image(systemName: "bell")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .foregroundStyle(.foreground)
                        
                        Image(systemName: "bell.badge")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .foregroundStyle(PColor.primary.color, .foreground)
                    }
                    .padding(.horizontal, 34)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        LazyHStack{
                            CardScrollItemView()
                            CardScrollItemView()
                        }
                        .scrollTargetLayout()
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .scrollTargetBehavior(.viewAligned)
                    .contentMargins(.horizontal, 34)
                    .defaultScrollAnchor(.leading)
                    
                    RoundButton(action: {cardDetailService.getCardDetails()}, iconName: "play.circle.fill", buttonText: "Tutorial")
                    
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


struct CardScrollItemView: View {
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

struct RoundButton: View {
    
    let action: () -> Void
    let iconName: String
    let buttonText: String
    
    var body: some View {
        VStack{
            Button(action: action, label: {
                Circle().frame(width: 53)
                    .foregroundStyle(PColor.primary.color)
                    .opacity(0.1)
                    .overlay {
                        Image(systemName: iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .foregroundStyle(PColor.primary.color)
                    }
            })
            Text(buttonText)
                .font(PFont.Mulish.Regular.size(12))
                .foregroundStyle(PColor.black1.color)
        }
    }
}
