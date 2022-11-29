//
//  DataFetcherTests.swift
//  MyMoviesTests
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import XCTest
@testable import MyMovies

final class DataFetcherTests: XCTestCase {
    func testWhenAuthenticationFails_shouldThrowAuthenticationError() async throws {
        var mockAuthenticator = MockAuthenticator()
        mockAuthenticator.token = nil

        let sut = DataFetcher()
        sut.authenticator = mockAuthenticator
        do {
            let result: Person = try await sut.fetch(endpoint: .localhost, parameters: [])
            XCTFail("Expected authentication error but received a result \(result)")
        } catch {
            let error: CoreError = try XCTUnwrap(error as? CoreError)
            switch error {
            case .authentication:
                XCTAssertTrue(true)
            default:
                XCTFail("Received unexpected error")
            }
        }
    }

    func testWhenUrlIsInvalid_shouldThrowInvalidUrlError() async throws {
        var mockAuthenticator = MockAuthenticator()
        mockAuthenticator.token = "123"

        let sut = DataFetcher()
        sut.authenticator = mockAuthenticator
        do {
            let result: Person = try await sut.fetch(endpoint: .invalidEndpoint, parameters: [])
            XCTFail("Expected invalid url error but received a result \(result)")
        } catch {
            let error: CoreError = try XCTUnwrap(error as? CoreError)
            switch error {
            case .invalidUrl:
                XCTAssertTrue(true)
            default:
                XCTFail("Received unexpected error")
            }
        }
    }
}

private extension NetworkEndpoint {
    static let localhost = NetworkEndpoint(path: "/8080",
                                           scheme: "http",
                                           appConfiguration: MockAppConfiguration.self)

    // path is missing a front slash
    static let invalidEndpoint = NetworkEndpoint(path: "8080",
                                                 scheme: "http",
                                                 appConfiguration: MockAppConfiguration.self)
}
