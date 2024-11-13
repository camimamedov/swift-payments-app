//
//  HomeView.swift
//  Payments
//
//  Created by Cami Mamedov on 19.05.24.
//

import SwiftUI
import Factory

struct HomeScreen: View {
    
    @EnvironmentObject private var cardService: CardService
    
    var body: some View {
        ZStack{
            PColor.background.color
                .edgesIgnoringSafeArea(.all)
            
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
                        ForEach(cardService.cards){ card in
                            CardScrollItemView(card: card)
                        }
                    }
                    .scrollTargetLayout()
                }
                .fixedSize(horizontal: false, vertical: true)
                .scrollTargetBehavior(.viewAligned)
                .contentMargins(.horizontal, 34)
                .defaultScrollAnchor(.leading)
                
                RoundButton(action: {cardService.addCard()}, iconName: "play.circle.fill", buttonText: "Tutorial")
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    HomeScreen()
        .environmentObject(CardService())
}


struct CardScrollItemView: View {
    let card: CardModel
    
    var body: some View {
        CardView(cardNumber: card.cardNumber,
                 validThru: card.validThru,
                 ownerName: card.ownerName,
                 cardType: card.cardType)
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
                    .opacity(0.2)
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
