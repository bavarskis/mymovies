//
//  AppConfiguration.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import Foundation

struct AppConfiguration: AppConfigurable {
    static var serviceHost: String {
        "api.themoviedb.org"
    }

    static var serviceVersion: String {
        "/3"
    }

    static var imagesLocation: String {
        "https://image.tmdb.org/t/p/w500"
    }

    static var language: String {
        "en"
    }
}
