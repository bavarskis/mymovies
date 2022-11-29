//
//  MovieDetailsView.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 28/11/2022.
//

import SwiftUI

struct MovieDetailsView: View {
    private let movie: Movie
    @StateObject private var viewModel: ViewModel

    init(movie: Movie) {
        self.movie = movie
        _viewModel = StateObject(wrappedValue: ViewModel(movie: movie))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                StyledAsyncImage(path: viewModel.imagePath ?? "")
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(viewModel.movieInfo) { info in
                        Text(info.text)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(10)
            }.padding(10)
        }.onAppear {
            Task {
                try await viewModel.loadDetails()
            }
        }.toolbar {
            Button {
                viewModel.toggleFavorite()
            } label: {
                Image(systemName: viewModel.favoriteButtonImage)
            }
        }.background(
            Image("film")
                .resizable()
                .scaledToFill()
                .blur(radius: 30)
                .zIndex(0)
        )
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie(id: 0, title: "Preview", backdropPath: nil))
    }
}
