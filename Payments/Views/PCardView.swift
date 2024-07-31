//
//  PCardView.swift
//  Payments
//
//  Created by Cami Mamedov on 30.07.24.
//

import SwiftUI

struct PCardView: View {
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
                
                Text("5355   0348   5945   5045")
                    .kerning(0.9)
                    .font(PFont.Mulish.SemiBold.size(18))
            }
            
            
            
            
            HStack (alignment: .bottom){
                VStack (alignment: .leading){
                    HStack {
                        Text("VALID\nTHRU")
                            .font(PFont.Mulish.SemiBold.size(5))
                        
                        Text("12/24")
                            .font(PFont.Mulish.SemiBold.size(9))
                    }
                    .padding(.bottom, 15)
                    
                    Text("MAMMADOV CAMI")
                        .font(PFont.Mulish.Bold.size(10))
                }

                Spacer()
                
                Image("mastercard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 42)
            }
        }
        .padding(.horizontal, 22)
        .foregroundStyle(.white)
        .frame(width: 283, height: 176)
        .background {
            LinearGradient(colors: [PColor.primary.color, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
        .shadow(radius: 10)
    }
}

#Preview {
    PCardView()
}
