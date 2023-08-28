//
//  MovieListItemView.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 25/08/2023.
//

import SwiftUI
import Kingfisher

struct MovieListItemView: View {

    let movie: MovieDataModel
    let imageWidth: CGFloat = 180

    var body: some View {
        HStack {
            KFImage(URL(string: APIConstants.imagesBaseURL + movie.posterPath))
                .placeholder({ _ in
                    LoaderView(color: Color.green)
                })
                .resizable()
                .frame(width: imageWidth)
                .scaledToFit()

            VStack(spacing: Constants.padding8) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.overview)
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                Spacer()
            }
            .padding(.top, Constants.padding8)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
