//
//  MoviesListView.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 23/08/2023.
//

import SwiftUI

struct MoviesListView: View {
    
    @StateObject var viewModel: MoviesListViewModel
    private let cellMargins: CGFloat = 16
    private let cellHeight: CGFloat = 300
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.moviesList) { item in
                            //TODO: check if we need to change the data model
                            NavigationLink {
                                MovieDetailsView(viewModel: MovieDetailsViewModel(id: item.id))
                            } label: {
                                MovieListItemView(movie: item)
                                    .frame(width: geometry.size.width - cellMargins, height: cellHeight)
                                    .onAppear {
                                        viewModel.loadMore(currentItem: item)
                                    }
                            }
                            .tint(.black)
                            
                        }
                        
                        if viewModel.showLoader {
                            LoaderView()
                        }
                    }
                }
                .modifier(TopMessageModifier(isPresented: $viewModel.errorViewPresented, text: viewModel.errorMessage))
                .navigationTitle("iMovies")
                .task {
                    viewModel.loadMovies()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView(viewModel: MoviesListViewModel())
    }
}
