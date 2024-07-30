//
//  LoadingView.swift
//  Payments
//
//  Created by Cami Mamedov on 29.07.24.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isAnimate = false;
    @State private var rotationDegree = 0;
    
    var body: some View {
        
        
        VStack{
            Spacer();
            
            Image("payper-logo")
                .resizable()
                .frame(width: 330, height: 75)
                .padding(.bottom, 200)
            
            ZStack{
                Circle()
                    .stroke(lineWidth: 5)
                    .frame(width: 42)
                    .foregroundColor(.secondary)
                
                Circle()
                    .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.5)
                    .stroke(lineWidth: 5)
                    .frame(width: 42)
                    .foregroundColor(PColor.primary.color)
                    .rotationEffect(.degrees(isAnimate ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimate)
                    .onAppear() {
                        isAnimate.toggle()
                    }
            }
            .padding(.bottom, 60)
            
            Text("Version 0.1")
                .font(.system(size: 12))
        }
    }
}

#Preview {
    LoadingView()
}
