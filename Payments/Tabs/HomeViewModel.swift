//
//  HomeViewModel.swift
//  Payments
//
//  Created by Cami Mamedov on 20.05.24.
//

import Foundation

@MainActor final class HomeViewModel: ObservableObject
{
    @Published var userData: UserData?
    
    func getUserData(){
        Task{
            do {
                userData = try await NetworkManager.shared.getUserData()
                print(userData)
            }
            catch{
                if let error = error as? NetworkError{
                    switch error {
                    case .invalidUrl:
                        break
                    case .noData:
                        break
                    case .invalidData:
                        break
                    }
                }else{
                    //Generic Error
                    //alertItem = AlertContext.invalidResponse
                }
            }
        }
    }
}
