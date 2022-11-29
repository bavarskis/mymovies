//
//  MockAuthenticator.swift
//  MyMoviesTests
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

@testable import MyMovies

struct MockAuthenticator: SessionAuthenticating {
    var token: String?

    func authenticate() async throws -> ApiToken {
        guard let token = token else {
            throw CoreError.authentication
        }
        return token
    }
}
