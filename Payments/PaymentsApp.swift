//
//  PaymentsApp.swift
//  Payments
//
//  Created by Cami Mamedov on 19.05.24.
//

import SwiftUI

@main
struct PaymentsApp: App {
    
    @StateObject private var errorState = ErrorState()
    
    init() {
        configureTabBar()
    }
    
    private func configureTabBar(){
        // Customize the tab bar appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(PColor.background.color) // Set your desired background color here
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
        UINavigationBar.appearance().backgroundColor = UIColor(PColor.background.color)
        UITableView.appearance().backgroundColor = UIColor(PColor.background.color)
        UITableViewCell.appearance().backgroundColor = UIColor(PColor.background.color)
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                PColor.background.color
                    .edgesIgnoringSafeArea(.vertical)
                PTabView()
                    .environmentObject(CardService())
                    .environmentObject(errorState)
                    .overlay(content: {
                        if(errorState.error != nil){
                            ErrorView(error: $errorState.error)
                        }
                    })
            }
        }
    }
}
