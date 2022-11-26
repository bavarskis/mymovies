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
    let appConfiguration: AppConfigurable

    init(scheme: String = "http",
         path: String,
         appConfiguration: AppConfigurable = AppConfiguration()) {
        self.scheme = scheme
        self.path = path
        self.appConfiguration = appConfiguration
    }

    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = appConfiguration.serviceHost
        components.path = appConfiguration.serviceVersion + path
        return components
    }
}
