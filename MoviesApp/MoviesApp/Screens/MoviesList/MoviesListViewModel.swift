//
//  MoviesListViewModel.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 25/08/2023.
//

import Foundation

class MoviesListViewModel: ObservableObject {
    
    private let repository: MoviesListRepositoryProtocol
    @Published var moviesList: [MovieDataModel] = []
    @Published var showLoader: Bool = false
    @Published var errorViewPresented: Bool = false
    var errorMessage: String = ""
    private(set) var page: Int = 0
    private var totalPagesCount: Int = 0
    private let loadMoreOffset: Int = 4
    
    init(repository: MoviesListRepositoryProtocol = MoviesListRepository()) {
        self.repository = repository
    }
    
    func loadMovies() async {
        await MainActor.run {
            showLoader = true
        }
        page+=1
        let result = await repository.getAnimationMovies(page: page)
        switch result {
        case .success(let model):
            totalPagesCount = model.totalPages
            await MainActor.run {
                self.moviesList.append(contentsOf: model.results)
            }
        case .failure(let failure):
            page-=1
            await showErrorMessage(error: failure)
        }
        await MainActor.run {
            self.showLoader = false
        }
    }
    
    func loadMore(currentItem: MovieDataModel) async {
        guard let currentIndex = moviesList.firstIndex(where: { $0.id == currentItem.id }),
              currentIndex == moviesList.index(moviesList.endIndex, offsetBy: -loadMoreOffset),
              page < totalPagesCount else {
            return
        }
        await loadMovies()
    }
    
    func showErrorMessage(error: AppErrors) async {
        errorMessage = ErrorUtils.getErrorMessage(error: error)
        await MainActor.run {
            self.errorViewPresented = true
        }
    }
}
