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
                        viewModel.loadData(for: .nowPlaying)
                    }

                // Popular
                MoviesCollectionView(title: viewModel.popularTitle, movies: viewModel.nowPlayingMovies)
                    .task {
                        viewModel.loadData(for: .popular)
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
