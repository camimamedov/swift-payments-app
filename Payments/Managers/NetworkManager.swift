//
//  NetworkManager.swift
//  Payments
//
//  Created by Cami Mamedov on 20.05.24.
//

import Foundation

final class NetworkManager
{
    static let shared = NetworkManager()
    
    private let baseURL = "https://664ba14b35bbda10987da2ba.mockapi.io"
    
    func getUserData() async throws -> UserData {
        guard let url = URL(string: "\(baseURL)/user") else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
                
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.noData
        }
        
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response = try decoder.decode(UserData.self, from: data)
            return response
        }
        catch{
            throw NetworkError.invalidData
        }
    }
}


struct UserData: Codable, Hashable
{
    var id: Int
    var name: String
    var avatar: String
    var createdAt: String
    var balance: Float
}
