//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 26/08/2023.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    
    private let repository: MovieDetailsRepositoryProtocol
    private let movieId: Int
    private let emptyText: String = "---"
    @Published var details: MoviesDetailsResponseModel?
    @Published var errorViewPresented: Bool = false
    var errorMessage: String = ""
    
    init(id: Int, repository: MovieDetailsRepositoryProtocol = MovieDetailsRepository()) {
        self.repository = repository
        self.movieId = id
    }
    
    
    func getMovieDetails() async {
        let result = await repository.getMovie(id: movieId)
        switch result {
        case .success(let response):
            DispatchQueue.main.async {
                self.details = response
            }
        case .failure(let failure):
            showErrorMessage(error: failure)
        }
    }
    
    func showErrorMessage(error: AppErrors) {
        errorMessage = ErrorUtils.getErrorMessage(error: error)
        DispatchQueue.main.async {
            self.errorViewPresented = true
        }
    }
}


//MARK: - UI computed properties
extension MovieDetailsViewModel {
    
    var title: String {
        details?.title ?? emptyText
    }
    
    var overview: String {
        details?.overview ?? emptyText
    }
    
    var posterImagePath: String {
        APIConstants.imagesBaseURL + (details?.backdropPath ?? "")
    }
    
    var voteAverageProgress: Double {
        (details?.voteAverage ?? 0) / 10
    }
    
    var voteAverageText: String {
        String(format: "%.1f%", voteAverageProgress * 10)
    }
    
    var releaseDate: String {
        DateUtils.formatDate(details?.releaseDate ?? "") ?? emptyText
    }
    
    var revenue: String {
        "$\((details?.revenue ?? 0).formatted())"
    }
    
    var generesText: String {
        details?.genres.map({$0.name}).joined(separator: ", ") ?? emptyText
    }
}
