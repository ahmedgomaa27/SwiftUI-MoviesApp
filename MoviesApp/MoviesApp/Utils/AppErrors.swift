//
//  AppErrors.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 27/08/2023.
//

import Foundation

enum AppErrors: Error {
    case invalidURL
    case invalidResponse(description: String?)
    case invalidRequest
    case genericError
}
