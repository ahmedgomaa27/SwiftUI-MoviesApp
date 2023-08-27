//
//  Constants.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 27/08/2023.
//

import Foundation

struct Constants {
    static let padding8: CGFloat = 8
    //TODO: check name
    static let defaultAccessToken: String = "YOUR_TOKEN"
    
    enum Errors: Error {
        case invalidURL
        case invalidResponse(description: String?)
        case invalidRequest
        case genericError
    }
}
