//
//  DataFetching.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import Foundation

protocol DataFetching {
    var authenticator: SessionAuthenticating { get }
    var urlSessionConfiguration: URLSessionConfiguration { get }
    var urlSession: URLSession { get }
    func fetch<DataType: Codable>(endpoint: NetworkEndpoint, parameters: RequestParameters) async throws -> DataType
}

extension DataFetching {
    func fetch<DataType: Codable>(endpoint: NetworkEndpoint, parameters: RequestParameters) async throws -> DataType {
        let token = try await authenticator.authenticate()

        var urlComponents = endpoint.urlComponents
        urlComponents.queryItems = parameters.queryItems + [URLQueryItem(name: "api_key", value: token)]

        guard
            let urlString = urlComponents.string,
            let url = URL(string: urlString)
        else {
            throw CoreError.invalidUrl
        }

        let session = URLSession(configuration: URLSessionConfiguration.default)
        let dataAndResponse = try await session.data(from: url)
        guard let object = try? JSONDecoder().decode(DataType.self, from: dataAndResponse.0) else {
            throw CoreError.mapping
        }

        return object
    }
}
