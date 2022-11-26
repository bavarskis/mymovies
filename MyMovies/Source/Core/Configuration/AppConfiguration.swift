//
//  AppConfiguration.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import Foundation

struct AppConfiguration: AppConfigurable {
    var serviceHost: String {
        "api.themoviedb.org"
    }

    var serviceVersion: String {
        "/3"
    }

    var language: String {
        "en"
    }
}
