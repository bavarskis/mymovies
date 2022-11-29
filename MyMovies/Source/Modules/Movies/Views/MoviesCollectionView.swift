//
//  MoviesCollectionView.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 28/11/2022.
//

import SwiftUI
import ACarousel

struct MoviesCollectionView: View {
    let title: String
    let movies: [Movie]

    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(15)
            .font(.headline)
            .lineLimit(2)

        ScrollView(.horizontal) {
            HStack(spacing: 25) {
                ForEach(movies) { movie in
                    GeometryReader { proxy in
                        NavigationLink(destination: MovieDetailsView(movie: movie)) {
                            MovieView(movie: movie)
                                .scaleEffect(applyCarouselEffect(proxy: proxy))
                        }
                    }
                    .frame(width: 300, height: 200)
                }
            }
            .padding(30)
        }
    }

    private func applyCarouselEffect(proxy: GeometryProxy) -> CGFloat {
        let midX = proxy.frame(in: .global).midX
        let width = UIScreen.main.bounds.width
        return scale(num: midX, limit: width)
    }

    private func scale(num: CGFloat, limit: CGFloat, factor: CGFloat = 0.2, baseScale: CGFloat = 0.95) -> CGFloat {
        guard num >= 0 && num <= limit else {
            return baseScale
        }

        let midPointOfClippedArea = limit / 2.0
        // Shift visible range so that mid point is at 0
        let shifted = (midPointOfClippedArea - limit) + num
        // Map values to -1 to 1 range
        let amplitude = (1.0 / midPointOfClippedArea) * shifted
        // Make positive, thus from 0 to 1
        let positive = abs(amplitude)
        let inverted = abs(positive - 1)
        // Apply nonlinearity for more natural feel
        let sqrt = sqrt(inverted)
        let scaled = baseScale + (sqrt * factor)
        return scaled
    }
}
