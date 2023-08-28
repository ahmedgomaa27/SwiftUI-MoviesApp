//
//  MovieListTests.swift
//  MovieListTests
//
//  Created by Ahmed Hamdy on 28/08/2023.
//

import XCTest
import Combine
@testable import iMovies

final class MovieListTests: XCTestCase {
    
    var viewModel: MoviesListViewModel!
    var mockedRepository: MoviesListRepositoryProtocol!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockedRepository = MockedMoviesListRepository(withSuccessResult: true)
        viewModel = MoviesListViewModel(repository: mockedRepository)
    }
    
    func testBindingMoviesList() async {
        await viewModel.loadMovies()
        XCTAssertTrue(viewModel.moviesList.count > 0)
    }
    
    //we need to make sure movies are loaded and validate load more logic with each item
    func testLoadMore() async {
        await viewModel.loadMovies()
        let initialPage = viewModel.page
        for item in viewModel.moviesList {
            await viewModel.loadMore(currentItem: item)
        }
        XCTAssertTrue(viewModel.page > initialPage)
    }
    
    func testErrorHandling() async {
        mockedRepository = MockedMoviesListRepository(withSuccessResult: false)
        viewModel = MoviesListViewModel(repository: mockedRepository)
        await viewModel.loadMovies()
        XCTAssertTrue(viewModel.errorViewPresented)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        mockedRepository = nil
    }
    
}
