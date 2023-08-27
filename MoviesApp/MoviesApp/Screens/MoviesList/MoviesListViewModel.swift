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
    private var page: Int = 0
    private var totalPagesCount: Int = 0
    private let loadMoreOffset: Int = 4
    
    init(repository: MoviesListRepositoryProtocol = MoviesListRepository()) {
        self.repository = repository
    }
    
    func loadMovies() {
        showLoader = true
        page+=1
        Task {
            let result = await repository.getAnimationMovies(page: page)
            switch result {
            case .success(let model):
                totalPagesCount = model.totalPages
                DispatchQueue.main.async {
                    self.moviesList.append(contentsOf: model.results)
                }
            case .failure(let failure):
                page-=1
                showErrorMessage(error: failure)
            }
            //TODO: check this handling
            DispatchQueue.main.async {
                self.showLoader = false
            }
        }
    }
    
    func loadMore(currentItem: MovieDataModel) {
        //TODO: check behaviour on the device
        guard let currentIndex = moviesList.firstIndex(where: { $0.id == currentItem.id }),
              currentIndex == moviesList.index(moviesList.endIndex, offsetBy: -loadMoreOffset),
              page < totalPagesCount else {
            return
        }
        loadMovies()
    }
    
    func showErrorMessage(error: AppErrors) {
        errorMessage = ErrorUtils.getErrorMessage(error: error)
        DispatchQueue.main.async {
            self.errorViewPresented = true
        }
    }
}
