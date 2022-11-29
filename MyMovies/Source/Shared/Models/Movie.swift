//
//  Movie.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 27/11/2022.
//

import Foundation

struct Movie: Codable, Identifiable, Equatable {
    let id: Int
    let title: String
    let backdropPath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case backdropPath = "backdrop_path"
    }
}

extension Movie {
    var backdropFullPath: String? {
        backdropPath.flatMap { AppConfiguration.imagesLocation + $0 }
    }
}
