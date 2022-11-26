//
//  MockAppConfiguration.swift
//  MyMoviesTests
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

@testable import MyMovies

struct MockAppConfiguration: AppConfigurable {
    var serviceHost: String {
        "localhost"
    }

    var serviceVersion: String {
        ""
    }

    var language: String {
        "en"
    }
}
