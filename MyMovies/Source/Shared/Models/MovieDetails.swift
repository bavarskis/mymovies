//
//  MovieDetails.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 29/11/2022.
//

import Foundation

struct MovieDetails: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let tagline: String?
    let rating: Double?
    let backdropPath: String?
    let budget: Double?
    let genres: [MoviewGenre]?
    let isAdultMovie: Bool?
    let homepage: String?
    let overview: String?
    let language: String?
    let releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case tagline
        case rating = "vote_average"
        case backdropPath = "backdrop_path"
        case budget
        case genres
        case isAdultMovie = "adult"
        case homepage
        case overview
        case language = "original_language"
        case releaseDate = "release_date"
    }

    static func == (lhs: MovieDetails, rhs: MovieDetails) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension MovieDetails {
    struct MoviewGenre: Codable, Identifiable {
        let id: Int
        let name: String
    }
}

extension MovieDetails {
    var backdropFullPath: String? {
        backdropPath.flatMap { AppConfiguration.imagesLocation + $0 }
    }
}
