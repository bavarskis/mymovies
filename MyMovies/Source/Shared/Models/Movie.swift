//
//  Movie.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 27/11/2022.
//

import Foundation

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let backdrop_path: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case backdrop_path = "backdrop_path"
    }
}

extension Movie: Equatable {}

extension Movie {
    var backdropFullPath: String? {
        backdrop_path.flatMap { AppConfiguration.imagesLocation + $0 }
    }
}

