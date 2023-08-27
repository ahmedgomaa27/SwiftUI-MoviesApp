//
//  MoviesListResponseModel.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 23/08/2023.
//

import Foundation

// MARK: - MoviesListResponseModel
struct MoviesListResponseModel: Codable {
    let page: Int
    let results: [MovieDataModel]
    let totalPages, totalResults: Int

}

// MARK: - MovieDataModel
struct MovieDataModel: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

}
