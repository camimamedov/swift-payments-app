//
//  PaymentsApp.swift
//  Payments
//
//  Created by Cami Mamedov on 19.05.24.
//

import SwiftUI

@main
struct PaymentsApp: App {
    
    init() {
        configureTabBar()
    }
    
    private func configureTabBar(){
        // Customize the tab bar appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBackground // Set your desired background color here
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            PTabView()
        }
    }
}
