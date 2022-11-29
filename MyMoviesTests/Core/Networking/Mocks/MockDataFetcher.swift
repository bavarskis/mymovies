//
//  MockDataFetcher.swift
//  MyMoviesTests
//
//  Created by Aurimas Bavarskis on 29/11/2022.
//

import Foundation
@testable import MyMovies

class MockDataFetcher: DataFetching {
    var authenticator: SessionAuthenticating
    var urlSession: URLSession
    var data: Any?
    var error: CoreError?

    init(authenticator: MockAuthenticator,
         urlSession: URLSession) {
        self.authenticator = authenticator
        self.urlSession = urlSession
    }

    func fetch<DataType>(endpoint: NetworkEndpoint, parameters: [RequestParameters]) async throws -> DataType where DataType : Decodable, DataType : Encodable {
        if let data = self.data as? DataType {
            return data
        } else {
            throw error ?? CoreError.generic
        }
    }
}
