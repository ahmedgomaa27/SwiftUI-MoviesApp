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
    
}

extension ApiTarget {
    //TODO: remove token from hard coded string
    //header will default in all network cases
    var headers: [String : String] {
        ["accept": "application/json",
         "Authorization": "Bearer \(Constants.defaultAccessToken)"]
    }
}

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}
