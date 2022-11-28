//
//  SessionAuthenticator.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import Foundation

struct SessionAuthenticator: SessionAuthenticating {
    // For purposes of clarity authentication is async
    // even though the `TMDB` consumes a static token.
    func authenticate() async throws -> ApiToken {
        let token = Self.token()

        guard !token.isEmpty else {
            throw CoreError.authentication
        }

        return token
    }

    private static func token() -> String {
        // Token is stored in an untracked text file in the bundle.
        // In order for the app to authenticate
        // go to `https://www.themoviedb.org/settings/apicreate`
        // create an account, generate a token
        // and store a text file in the bundle
        guard let filepath = Bundle.main.path(forResource: "moviedbtoken", ofType: "txt"),
              let contents = try? String(contentsOfFile: filepath) else {
            return ""
        }

        return contents
    }
}
