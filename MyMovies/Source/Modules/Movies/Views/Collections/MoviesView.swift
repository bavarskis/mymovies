//
//  MoviesView.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import SwiftUI

struct MoviesView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        ScrollView {
            VStack {
                // Now playing
                MoviesCollectionView(title: viewModel.nowPlayingTitle, movies: viewModel.nowPlayingMovies)
                    .task {
                        do {
                            try await viewModel.loadData(for: .nowPlaying)
                        } catch {
                            // Needs to be handled
                        }
                    }

                // Popular
                MoviesCollectionView(title: viewModel.popularTitle, movies: viewModel.popularMovies)
                    .task {
                        do {
                            try await viewModel.loadData(for: .popular)
                        } catch {
                            // Needs to be handled
                        }
                    }
            }
        }
        .background(
            Image("camera")
                .resizable()
                .scaledToFill()
                .blur(radius: 30)
                .zIndex(0)
        )
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
