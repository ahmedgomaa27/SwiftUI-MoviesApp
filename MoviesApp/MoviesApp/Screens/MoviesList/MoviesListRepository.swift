//
//  MoviesListService.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 24/08/2023.
//

import Foundation

protocol MoviesListRepositoryProtocol {
    func getAnimationMovies(page: Int) async -> Result<MoviesListResponseModel, Constants.Errors>
}

class MoviesListRepository: MoviesListRepositoryProtocol {

    func getAnimationMovies(page: Int = 1) async -> Result<MoviesListResponseModel, Constants.Errors> {
        let parameters: [String: String] = ["with_genres": "\(APIConstants.animationGenreId)", "page": "\(page)"]
        do {
            let response: MoviesListResponseModel = try await NetworkManager.call(target: .moviesList(parameters: parameters))
            return .success(response)
        } catch {
            //TODO: validate logic
            guard let appError = error as? Constants.Errors else { return .failure(Constants.Errors.genericError) }
            return .failure(appError)
        }
        
    }
}
