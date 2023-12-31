//
//  MoviesListService.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 24/08/2023.
//

import Foundation

protocol MoviesListRepositoryProtocol {
    func getAnimationMovies(page: Int) async -> Result<MoviesListResponseModel, AppErrors>
}

class MoviesListRepository: MoviesListRepositoryProtocol {

    func getAnimationMovies(page: Int = 1) async -> Result<MoviesListResponseModel, AppErrors> {
        let parameters: [String: String] = ["with_genres": "\(APIConstants.animationGenreId)", "page": "\(page)"]
        do {
            let response: MoviesListResponseModel = try await NetworkManager.call(target: AppTarget.moviesList(parameters: parameters))
            return .success(response)
        } catch {
            guard let appError = error as? AppErrors else {
                return .failure(AppErrors.genericError)
            }
            return .failure(appError)
        }
        
    }
}
