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
    private var details: MoviesDetailsResponseModel?
    @Published var errorViewPresented: Bool = false
    @Published var loadDataDone: Bool = false
    var errorMessage: String = ""
    
    init(id: Int, repository: MovieDetailsRepositoryProtocol = MovieDetailsRepository()) {
        self.repository = repository
        self.movieId = id
    }
    
    
    func getMovieDetails() async {
        let result = await repository.getMovie(id: movieId)
        switch result {
        case .success(let response):
            await MainActor.run {
                self.details = response
                self.loadDataDone = true
            }
        case .failure(let failure):
           await showErrorMessage(error: failure)
        }
    }
    
    func showErrorMessage(error: AppErrors) async {
        errorMessage = ErrorUtils.getErrorMessage(error: error)
        await MainActor.run {
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
