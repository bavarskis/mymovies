//
//  NetworkEndpoint+Movies.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import Foundation

extension NetworkEndpoint {
    static let nowPlayingMovies = NetworkEndpoint(path: "/movie/now_playing")
    // For demo purposes using `top_rated`
    // because `popular` endpoint returns same results as `now_paying`
    static let popularMovies = NetworkEndpoint(path: "/movie/top_rated")
    static let movieDetails = NetworkEndpoint(path: "/movie/\(PathComponentParameterName.movieId.value)")
}
