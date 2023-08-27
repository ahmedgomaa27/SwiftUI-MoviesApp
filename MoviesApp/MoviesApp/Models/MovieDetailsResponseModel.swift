//
//  MovieDetailsResponseModel.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 26/08/2023.
//

import Foundation

// MARK: - MoviesDetailsResponseModel
struct MoviesDetailsResponseModel: Codable {
    let adult: Bool
    let backdropPath: String
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbId, originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let revenue, runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, iso6391, name: String
}

