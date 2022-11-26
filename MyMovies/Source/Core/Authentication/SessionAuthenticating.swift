//
//  SessionAuthenticating.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import Foundation

protocol SessionAuthenticating {
    typealias ApiToken = String
    func authenticate() async throws -> ApiToken
}
