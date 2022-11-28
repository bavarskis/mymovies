//
//  MoviesCollectionView.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 28/11/2022.
//

import SwiftUI

struct MoviesCollectionView: View {
    let title: String
    let movies: [Movie]

    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(15)
            .font(.headline)
            .lineLimit(2)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(movies, id: \.id) { movie in
                    NavigationLink(destination: MovieDetailsView(movie: movie)) {
                        ImageAndText(imagePath: movie.backdropFullPath, text: movie.title)
                            .onTapGesture {

                            }
                    }
                }
            }
            .padding(15)
        }
    }
}
