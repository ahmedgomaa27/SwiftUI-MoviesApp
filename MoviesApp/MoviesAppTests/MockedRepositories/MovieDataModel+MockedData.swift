//
//  MovieDataModel+MockedData.swift
//  MoviesAppTests
//
//  Created by Ahmed Hamdy on 28/08/2023.
//

@testable import iMovies

extension MovieDataModel {
    static let mockedItems = [generateMockedData(randomID: 11111),
                              generateMockedData(randomID: 22222),
                              generateMockedData(randomID: 33333),
                              generateMockedData(randomID: 44444),
                              generateMockedData(randomID: 55555),
                              generateMockedData(randomID: 66666)]
    
    static func generateMockedData(randomID: Int) -> MovieDataModel {
        MovieDataModel(backdropPath: "mockedBackdropPath",
                       genreIds: [1, 2, 3],
                       id: randomID,
                       originalLanguage: "en",
                       originalTitle: "Mocked Original Title",
                       overview: "This is a mocked movie overview.",
                       popularity: 7.8,
                       posterPath: "mockedPosterPath",
                       releaseDate: "2023-08-28",
                       title: "Mocked Title",
                       video: false,
                       voteAverage: 6.5,
                       voteCount: 1000)
    }
}
