//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 23/08/2023.
//

import Foundation

class NetworkManager {
    
    static func call<T: Codable>(target: ApiTarget) async throws -> T {
        
        guard let url = URL(string: target.path) else { throw AppErrors.invalidURL }
        
        do {
            let request = try prepareRequest(url: url, target: target)
            let (date, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw AppErrors.invalidResponse(description: nil)
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = target.keyDecodingStrategy
            return try decoder.decode(T.self, from: date)
        } catch {
            if let appError = error as? AppErrors {
                throw appError
            }
            throw AppErrors.invalidResponse(description: error.localizedDescription)
        }
    }
    
    private static func prepareRequest(url: URL, target: ApiTarget) throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        request.allHTTPHeaderFields = target.headers
        if let parameters = target.parameters {
            switch target.method {
            case .get:
                request.url?.append(queryItems: parameters.map({URLQueryItem(name: $0, value: $1)}))
            default:
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
                } catch {
                    throw AppErrors.invalidRequest
                }
            }
        }
        return request
    }
}
