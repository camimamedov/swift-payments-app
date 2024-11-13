//
//  ErrorView.swift
//  Payments
//
//  Created by Cami Mamedov on 11.11.24.
//

import SwiftUI

struct ErrorView: View {
    
    @Binding var error: CustomError?
    
    var body: some View {
        ZStack {
            BlurView(style: .regular)
                .ignoresSafeArea()
            
            VStack (spacing: 0){
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 87)
                    .foregroundStyle(PColor.red1.color)
                    .padding(.top, 90)
                
                Text("Something went wrong.")
                    .font(PFont.Mulish.Bold.size(22))
                    .foregroundStyle(PColor.red1.color)
                    .padding(.top, 38)
                
                if(error != nil){
                    Text(error!.description)
                        .font(PFont.Mulish.Regular.size(13))
                        .padding(.top, 7)
                }
                Button {
                    $error.wrappedValue = nil
                } label: {
                    Rectangle()
                        .frame(width: 246, height: 41)
                        .background(PColor.primary.color)
                        .opacity(0.2)
                        .clipShape(.rect(cornerRadius: 7))
                        .overlay {
                            Text("Okay")
                                .font(PFont.Mulish.SemiBold.size(18))
                        }
                }
                .padding(.top, 30)
                
                Spacer()
            }
            .frame(width: 317, height: 442)
            .background(PColor.background.color)
            .cornerRadius(17)
            .shadow(radius: 40)
        }
        
    }
}

#Preview {
    @Previewable @StateObject var errorState = ErrorState()
    ErrorView(error: $errorState.error)
}
