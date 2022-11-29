//
//  MoviewDetailsView+ViewModel.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 29/11/2022.
//

import SwiftUI

extension MovieDetailsView {
    @MainActor class ViewModel: ObservableObject {
        private(set) var movie: Movie
        private(set) var movieDetails: MovieDetails?

        @Published var imagePath: String?
        @Published var movieInfo: [MovieInfoLine] = []

        // Titles
        private let movieNameTitle = NSLocalizedString("title", comment: "")
        private let genresTitle = NSLocalizedString("genres", comment: "")
        private let taglineTitle = NSLocalizedString("tagline", comment: "")
        private let ratingTitle = NSLocalizedString("rating", comment: "")
        private let budgetTitle = NSLocalizedString("budget", comment: "")
        private let homepageTitle = NSLocalizedString("homepage", comment: "")
        private let overviewTitle = NSLocalizedString("overview", comment: "")
        private let movieLanguageTitle = NSLocalizedString("movieLanguage", comment: "")
        private let releaseDateTitle = NSLocalizedString("releaseDate", comment: "")

        init(movie: Movie) {
            self.movie = movie
            self.imagePath = movie.backdropFullPath
        }

        func loadDetails() {
            Task {
                let paramName = PathComponentParameterName.movieId
                let param = PathComponentParameter(name: paramName,
                                                   value: "\(movie.id)")

                let movieDetails: MovieDetails = try await DataFetcher().fetch(endpoint: .movieDetails, parameters: [.pathParameters([param])])
                self.movieDetails = movieDetails
                updateInfo()
            }
        }

        private func updateInfo() {
            var info: [MovieInfoLine] = []
            if let title = movieDetails?.title {
                info.append(format(title: movieNameTitle, value: title))
            }

            if let tagline = movieDetails?.tagline {
                info.append(format(title: taglineTitle, value: tagline))
            }

            if let rating = movieDetails?.rating {
                info.append(format(title: ratingTitle, value: String(format: "%.1f", rating)))
            }

            if let budget = movieDetails?.budget {
                let formatter = NumberFormatter()
                formatter.usesGroupingSeparator = true
                formatter.numberStyle = .currency
                formatter.currencyCode = "$"
                formatter.locale = Locale.current
                let value = formatter.string(from: NSNumber(value: budget)) ?? "-"

                info.append(format(title: budgetTitle, value: value))
            }

            if let genres = movieDetails?.genres?.compactMap({ $0.name }).joined(separator: ", ") {
                info.append(format(title: genresTitle, value: genres))
            }

            if let homepage = movieDetails?.homepage {
                info.append(format(title: homepageTitle, value: homepage))
            }

            if let language = movieDetails?.language {
                info.append(format(title: movieLanguageTitle, value: language))
            }

            if let releaseDate = movieDetails?.releaseDate {
                info.append(format(title: releaseDateTitle, value: releaseDate))
            }

            if let overview = movieDetails?.overview {
                info.append(format(title: overviewTitle, value: overview))
            }

            movieInfo = info
        }

        private func format(title: String, value: String) -> MovieInfoLine {
            let key: LocalizedStringKey = "**\(title)**: *\(value)*"
            return MovieInfoLine(text: key, id: title)
        }

        struct MovieInfoLine: Identifiable {
            private(set) var text: LocalizedStringKey
            private(set) var id: String
        }
    }
}
