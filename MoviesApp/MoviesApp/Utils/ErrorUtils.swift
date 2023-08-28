//
//  ErrorUtils.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 27/08/2023.
//

import Foundation

class ErrorUtils {

    class func getErrorMessage(error: AppErrors) -> String {
        switch error {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse(let description):
            return "Server Error: \(description ?? "please try again")"
        case .invalidRequest:
            return "Invalid Request"
        case .genericError:
            return "Something went wrong, please try again"
        }
    }
}
