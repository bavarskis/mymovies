//
//  MoviesViewModelTests.swift
//  MyMoviesTests
//
//  Created by Aurimas Bavarskis on 29/11/2022.
//

import XCTest
@testable import MyMovies
import SwiftUI

@MainActor final class MoviesViewModelTests: XCTestCase {
    let sessionConfiguration = URLSessionConfiguration.ephemeral

    lazy var mockAuthenticator: MockAuthenticator = {
        MockAuthenticator(token: "000")
    }()

    lazy var  mockDataFetcher: MockDataFetcher = {
        MockDataFetcher(authenticator: mockAuthenticator,
                                              urlSession: URLSession(configuration: sessionConfiguration))
    }()

    func testWhenFetchingMoviesSucceeds_shouldReturnAList() async throws {
        let sut = MoviesView.ViewModel(dataFetcher: mockDataFetcher)
        mockDataFetcher.data = Self.mockMoviesWrapper
        mockDataFetcher.error = nil

        try await sut.loadData(for: .nowPlaying)
        try await sut.loadData(for: .popular)
        XCTAssertEqual(sut.nowPlayingMovies.count, 3)
        XCTAssertEqual(sut.popularMovies.count, 3)
    }

    func testWhenFetchingMoviesFails_shouldReturnError() async throws {
        let sut = MoviesView.ViewModel(dataFetcher: mockDataFetcher)
        mockDataFetcher.data = nil
        mockDataFetcher.error = CoreError.generic

        do {
            try await sut.loadData(for: .nowPlaying)
            XCTFail("Expected an error but received success")
        } catch {
            let error = try XCTUnwrap(error as? CoreError)
            switch error {
            case .generic:
                XCTAssertTrue(true)
            default:
                XCTFail("Did not expect other error than generic")
            }
        }

        do {
            try await sut.loadData(for: .popular)
            XCTFail("Expected an error but received success")
        } catch {
            let error = try XCTUnwrap(error as? CoreError)
            switch error {
            case .generic:
                XCTAssertTrue(true)
            default:
                XCTFail("Did not expect other error than generic")
            }
        }

        XCTAssertEqual(sut.nowPlayingMovies.count, 0)
        XCTAssertEqual(sut.popularMovies.count, 0)
    }
}

extension MoviesViewModelTests {
    static let mockMovies = [Movie(id: 0, title: "Movie 1", backdropPath: nil),
                             Movie(id: 1, title: "Movie 2", backdropPath: nil),
                             Movie(id: 2, title: "Movie 3", backdropPath: nil)]

    static let mockMoviesWrapper = Movies(results: mockMovies)
}
