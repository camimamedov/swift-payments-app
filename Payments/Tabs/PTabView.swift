//
//  ContentView.swift
//  Payments
//
//  Created by Cami Mamedov on 19.05.24.
//

// Default tab item creation
//.tabItem {
//    Image(systemName: "house")
//        .symbolVariant(.slash)
//        .environment(\.symbolVariants, .none)
//    Text("Home")
//}

import SwiftUI

struct PTabView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        ZStack (alignment: .bottom) {
            
            TabView (selection: $selectedTab) {
                HomeScreen()
                    .tag(0)
                StatisticsScreen()
                    .tag(1)
                PaymentScreen()
                    .tag(2)
                CardsScreen()
                    .tag(3)
                ProfileScreen()
                    .tag(4)
            }
            
            VStack{
                Spacer()
                HStack (alignment: .bottom) {
                        ForEach((TabItems.allCases), id: \.self){ item in
                            Button{
                                selectedTab = item.rawValue
                            } label: {
                                CustomTabItem(item: item, isActive: (selectedTab == item.rawValue), isCenter: item.rawValue == 2)
                            }
                            .padding(.horizontal, item.rawValue == 2 ? 0 : 10)
                        }
                    }
                .padding(.horizontal, 0)
                .padding(.vertical, -10)
            }
        }
    }
}

#Preview {
    PTabView()
        .environmentObject(CardService())
}

enum TabItems: Int, CaseIterable
{
    case home = 0
    case statistics
    case payment
    case cards
    case profile
    
    var title: String{
        switch self{
        case .home:
            return "Home"
        case .statistics:
            return "Statistics"
        case .payment:
            return "Pay"
        case .cards:
            return "My Cards"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String{
        switch self{
        case .home:
            return "house"
        case .statistics:
            return "chart.pie"
        case .payment:
            return "paperplane"
        case .cards:
            return "creditcard"
        case .profile:
            return "person.crop.circle"
        }
    }
}

extension PTabView{
    private func CustomTabItem(item: TabItems, isActive: Bool, isCenter: Bool) -> some View{
        VStack{
            
            ZStack{
                if isCenter{
                    Circle()
                        .foregroundStyle(PColor.primary.color.opacity(0.2))
                        .frame(width: 65)
                    Circle()
                        .foregroundStyle(PColor.primary.color)
                        .frame(width: 55)
                    
                    Image(systemName: item.iconName)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .scaledToFit()
                        .frame(width: 29, height: 29)
                }
                else{
                    Image(systemName: item.iconName)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(isActive ? PColor.primary.color : .gray)
                        .scaledToFit()
                        .frame(width: isCenter ? 29 : 25, height: isCenter ? 29 : 25)
                }
            }
            Text(item.title)
                .font(.system(size: 12))
                .foregroundColor(isActive ? PColor.primary.color : .gray)
        }
    }
}
