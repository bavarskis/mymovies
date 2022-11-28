//
//  MockAppConfiguration.swift
//  MyMoviesTests
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

@testable import MyMovies

struct MockAppConfiguration: AppConfigurable {
    static var serviceHost: String {
        "localhost"
    }

    static var serviceVersion: String {
        ""
    }

    static var imagesLocation: String {
        ""
    }

    static var language: String {
        "en"
    }
}
