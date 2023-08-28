//
//  AppTarget.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 26/08/2023.
//

import Foundation

enum AppTarget {
    case moviesList(parameters: [String: String])
    case movieDetails(id: Int)
}

extension AppTarget: ApiTarget {
    var path: String {
        switch self {
        case .moviesList:
            return APIConstants.baseURL + APIConstants.moviesList
        case .movieDetails(let id):
            return APIConstants.baseURL + APIConstants.movieDetails + "\(id)"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    
    var parameters: [String : String]? {
        switch self {
        case .moviesList(let parameters):
            return parameters
        case .movieDetails:
            return nil
        }
    }
    
}
