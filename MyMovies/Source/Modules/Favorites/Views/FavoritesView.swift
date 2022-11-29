//
//  FavoritesView.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.favorites) { movieDetails in
                    NavigationLink(destination: MovieDetailsView(movie: Movie(id: movieDetails.id, title: movieDetails.title, backdropPath: movieDetails.backdropPath))) {
                        ImageAndText(imagePath: movieDetails.backdropFullPath, text: movieDetails.title)
                    }
                }
            }
        }
        .background(.clear)
        .task {
            viewModel.fetchFavorites()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
