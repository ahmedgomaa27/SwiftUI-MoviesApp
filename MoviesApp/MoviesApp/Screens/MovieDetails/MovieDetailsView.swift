//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 26/08/2023.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    
    @StateObject var viewModel: MovieDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                KFImage(URL(string: viewModel.posterImagePath))
                    .placeholder({ _ in
                        LoaderView()
                    })
                    .resizable()
                    .scaledToFit()
                //TODO: check logic
                if viewModel.details != nil {
                    VStack(alignment: .leading) {
                        Text(viewModel.details?.title ?? "")
                            .font(.title)
                            .bold()
                        //TODO: check vm for title
                        TextWithTitleView(title: "Overview",
                                          text: viewModel.details?.overview)
                        
                        TextWithTitleView(title: "Release Date",
                                          text: viewModel.releaseDate)

                        TextWithTitleView(title: "Revenue",
                                          text: viewModel.revenue)

                        TextWithTitleView(title: "Genres",
                                          text: viewModel.generesText)
                    }
                    .padding(.leading, Constants.padding8)
                    .padding(.trailing, Constants.padding8)
                }
            }
        }
        .modifier(TopMessageModifier(isPresented: $viewModel.errorViewPresented, text: viewModel.errorMessage))
        .toolbar(content: {
            CircleProgressView(progress: viewModel.voteAverageProgress,
                               text: viewModel.voteAverageText)
        })
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.getMovieDetails()
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        //TODO: change the id
        MovieDetailsView(viewModel: MovieDetailsViewModel(id: 976573))
    }
}
