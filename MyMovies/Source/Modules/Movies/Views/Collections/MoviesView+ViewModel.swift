//
//  MoviesView+ViewModel.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 27/11/2022.
//

import SwiftUI

extension MoviesView {
    @MainActor class ViewModel: ObservableObject {
        let nowPlayingTitle = NSLocalizedString("nowPlaying", comment: "")
        let popularTitle = NSLocalizedString("popular", comment: "")

        @Published var nowPlayingMovies: [Movie] = []
        @Published var popularMovies: [Movie] = []

        private var dataFetcher: DataFetching = DataFetcher()

        func loadData(for movieType: MovieType) {
            Task {
                switch movieType {
                case .nowPlaying:
                    let movies: Movies = try await DataFetcher().fetch(endpoint: .nowPlayingMovies, parameters: [.empty])
                    nowPlayingMovies = movies.results
                case .popular:
                    let movies: Movies = try await DataFetcher().fetch(endpoint: .popularMovies, parameters: [.empty])
                    popularMovies = movies.results
                }
            }
        }

        enum MovieType {
            case nowPlaying
            case popular
        }
    }
}

