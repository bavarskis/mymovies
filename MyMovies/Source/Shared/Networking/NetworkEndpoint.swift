//
//  NetworkEndpoint.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import Foundation

struct NetworkEndpoint {
    let scheme: String
    let path: String
    let appConfiguration: AppConfigurable.Type

    init(path: String,
         scheme: String = "https",
         appConfiguration: AppConfigurable.Type = AppConfiguration.self) {
        self.path = path
        self.scheme = scheme
        self.appConfiguration = appConfiguration
    }

    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = appConfiguration.serviceHost
        components.path = appConfiguration.serviceVersion + path
        return components
    }
}
