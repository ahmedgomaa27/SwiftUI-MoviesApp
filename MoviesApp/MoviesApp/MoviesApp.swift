//
//  MoviesAppApp.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 23/08/2023.
//

import SwiftUI

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            MoviesListView(viewModel: MoviesListViewModel())
        }
    }
}
