//
//  MovieDetailsView.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 28/11/2022.
//

import SwiftUI

struct MovieDetailsView: View {
    private let movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }

    var body: some View {
        ScrollView {
            VStack {
                StyledAsyncImage(path: movie.backdropFullPath ?? "")
            }
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie(id: 0, title: "Preview"))
    }
}
