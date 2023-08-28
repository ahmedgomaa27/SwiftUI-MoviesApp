//
//  MockedMoviesListRepository.swift
//  MoviesAppTests
//
//  Created by Ahmed Hamdy on 28/08/2023.
//

@testable import iMovies

class MockedMoviesListRepository: MoviesListRepositoryProtocol {
    
    var withSuccessResult: Bool
    
    init(withSuccessResult: Bool) {
        self.withSuccessResult = withSuccessResult
    }
    
    func getAnimationMovies(page: Int) async -> Result<iMovies.MoviesListResponseModel, iMovies.AppErrors> {
        if withSuccessResult {
            //increase total pages to validate load more logic
            return .success(MoviesListResponseModel(page: page, results: MovieDataModel.mockedItems, totalPages: 10, totalResults: 100))
        } else {
            return .failure(.genericError)
        }
    }
    
    
}
