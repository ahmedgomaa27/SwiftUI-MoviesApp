//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 23/08/2023.
//

import Foundation

class NetworkManager {
    
    static func call<T: Codable>(target: AppTarget) async throws -> T {
        
        guard let url = URL(string: target.path) else { throw Constants.Errors.invalidURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        request.allHTTPHeaderFields = target.headers
        if let paramters = target.parameters {
            switch target.method {
            case .get:
                request.url?.append(queryItems: paramters.map({URLQueryItem(name: $0, value: $1)}))
            default:
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: paramters)
                } catch {
                    throw Constants.Errors.invalidRequest
                }
            }
        }
        
        do {
            let (date, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw Constants.Errors.invalidResponse(description: nil)
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = target.keyDecodingStrategy
            return try decoder.decode(T.self, from: date)
        } catch {
            throw Constants.Errors.invalidResponse(description: error.localizedDescription)
        }
    }
}
