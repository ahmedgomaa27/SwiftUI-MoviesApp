//
//  MovieDetailsRepository.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 26/08/2023.
//

import Foundation

protocol MovieDetailsRepositoryProtocol {
    func getMovie(id: Int) async -> Result<MoviesDetailsResponseModel, AppErrors>
}

class MovieDetailsRepository: MovieDetailsRepositoryProtocol {

    func getMovie(id: Int) async -> Result<MoviesDetailsResponseModel, AppErrors> {
        do {
            let response: MoviesDetailsResponseModel = try await NetworkManager.call(target: AppTarget.movieDetails(id: id))
            return .success(response)
        } catch {
            //TODO: validate logic
            guard let appError = error as? AppErrors else {
                return .failure(AppErrors.genericError)
            }
            return .failure(appError)
        }
        
    }
}
