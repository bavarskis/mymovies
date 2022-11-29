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
    func fetch<DataType: Codable>(endpoint: NetworkEndpoint, parameters: [RequestParameters]) async throws -> DataType
}

extension DataFetching {
    func fetch<DataType: Codable>(endpoint: NetworkEndpoint, parameters: [RequestParameters]) async throws -> DataType {
        let token = try await authenticator.authenticate()

        var urlComponents = endpoint.urlComponents

        urlComponents.queryItems = parameters.flatMap { $0.queryItems } + [URLQueryItem(name: "api_key", value: token)]

        let replaceablePathComponents = parameters.flatMap { $0.pathParameters }
        for component in replaceablePathComponents {
            urlComponents.path = urlComponents.path.replacingOccurrences(of: component.name.value, with: "\(component.value)")
        }

        guard
            let urlString = urlComponents.string,
            let url = URL(string: urlString)
        else {
            throw CoreError.invalidUrl
        }

        let session = URLSession(configuration: urlSessionConfiguration)
        let dataAndResponse = try await session.data(from: url)

        do {
            return try JSONDecoder().decode(DataType.self, from: dataAndResponse.0)
        } catch {
            print(error)
            throw CoreError.mapping(error)
        }
    }
}
