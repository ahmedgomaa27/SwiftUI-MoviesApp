//
//  APITarget.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 23/08/2023.
//

import Foundation

protocol ApiTarget {
    var headers: [String: String] { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: String]? { get }
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy { get }
    
}

extension ApiTarget {
    //header will default in all network cases
    var headers: [String : String] {
        ["accept": "application/json",
         "Authorization": "Bearer \(Constants.defaultAccessToken)"]
    }
    
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
         .convertFromSnakeCase
    }
}

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}
