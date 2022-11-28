//
//  DataFetcher.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import Foundation

class DataFetcher: DataFetching {
    lazy var authenticator: SessionAuthenticating = {
        SessionAuthenticator()
    }()

    lazy var urlSessionConfiguration: URLSessionConfiguration = {
        URLSessionConfiguration.default
    }()

    lazy var urlSession: URLSession = {
        URLSession(configuration: urlSessionConfiguration)
    }()
}
