//
//  MovieDetailsRepository.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 26/08/2023.
//

import Foundation

protocol MovieDetailsRepositoryProtocol {
    func getMovie(id: Int) async -> Result<MoviesDetailsResponseModel, Constants.Errors>
}

class MovieDetailsRepository: MovieDetailsRepositoryProtocol {

    func getMovie(id: Int) async -> Result<MoviesDetailsResponseModel, Constants.Errors> {
        do {
            let response: MoviesDetailsResponseModel = try await NetworkManager.call(target: .movieDetails(id: id))
            return .success(response)
        } catch {
            //TODO: validate logic
            guard let appError = error as? Constants.Errors else { return .failure(Constants.Errors.genericError) }
            return .failure(appError)
        }
        
    }
}
