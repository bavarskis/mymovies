//
//  MovieView.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 28/11/2022.
//

import SwiftUI

struct MovieView: View {
    let movie: Movie

    var body: some View {
        ImageAndText(imagePath: movie.backdropFullPath, text: movie.title)
    }
}

extension MovieView: Identifiable {
    var id: Int {
        movie.id
    }
}
