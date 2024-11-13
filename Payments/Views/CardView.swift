//
//  PCardView.swift
//  Payments
//
//  Created by Cami Mamedov on 30.07.24.
//

import SwiftUI

struct CardView: View {
    
    var cardNumber: String
    var validThru: String
    var ownerName: String
    var cardType: CardType
    
    var body: some View {
        VStack{
            HStack(alignment: .top){
                Text("Debit.")
                    .font(PFont.Mulish.Bold.size(10))
                
                Spacer()
                
                Text("Bank Name \n & Logo")
                    .multilineTextAlignment(.trailing)
                    .font(PFont.Mulish.Bold.size(12))
            }
    
            VStack{
                HStack{
                    Image("card-chip")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    
                    Spacer();
                }
                
                Text(convertCardNumber(from: cardNumber))
                    .kerning(0.9)
                    .font(PFont.Mulish.SemiBold.size(18))
            }
            
            HStack (alignment: .bottom){
                VStack (alignment: .leading){
                    HStack {
                        Text("VALID\nTHRU")
                            .font(PFont.Mulish.SemiBold.size(5))
                        
                        Text(validThru)
                            .font(PFont.Mulish.SemiBold.size(9))
                    }
                    .padding(.bottom, 15)
                    
                    Text(ownerName)
                        .font(PFont.Mulish.Bold.size(10))
                }

                Spacer()
                
                Image(cardType == .MasterCard ? "mastercard" : "visa")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42)
            }
            
        }
        .padding(.horizontal, 22)
        .foregroundStyle(.white)
        .frame(width: 283, height: 176)
        .background {
            LinearGradient(colors: [PColor.primary.color, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
        .shadow(radius: 10)
    }
    
    func convertCardNumber(from number: String) -> String{
        
        if number.count < 16
        {
            return "N/A"
        }
        else
        {
            return "\(number.substring(from: 0, to: 4))   \(number.substring(from: 4, to: 8))   \(number.substring(from: 8, to: 12))   \(number.substring(from: 12, to: 16))"
        }
    }
}

#Preview {
    CardView(cardNumber: "5355034859455045", validThru: "12/24",
              ownerName: "MAMMADOV CAMI" , cardType: .MasterCard)
}
