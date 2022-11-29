//
//  MovieDetailsViewModelTests.swift
//  MyMoviesTests
//
//  Created by Aurimas Bavarskis on 29/11/2022.
//

import XCTest
@testable import MyMovies
import SwiftUI

@MainActor final class MovieDetailsViewModelTests: XCTestCase {
    let sessionConfiguration = URLSessionConfiguration.ephemeral

    lazy var mockAuthenticator: MockAuthenticator = {
        MockAuthenticator(token: "000")
    }()

    lazy var  mockDataFetcher: MockDataFetcher = {
        MockDataFetcher(authenticator: mockAuthenticator,
                                              urlSession: URLSession(configuration: sessionConfiguration))
    }()

    func testWhenFetchingDetailsSucceeds_shouldAnObject() async throws {
        let sut = MovieDetailsView.ViewModel(movie: Self.mockMovie,
                                             dataFetcher: mockDataFetcher)
        mockDataFetcher.data = Self.mockMovieDetails
        mockDataFetcher.error = nil

        try await sut.loadDetails()
        XCTAssertNotNil(sut.movieDetails)
    }

    func testWhenFetchingDetailsFails_shouldReturnError() async throws {
        let sut = MovieDetailsView.ViewModel(movie: Self.mockMovie,
                                             dataFetcher: mockDataFetcher)
        mockDataFetcher.data = nil
        mockDataFetcher.error = CoreError.generic

        do {
            try await sut.loadDetails()
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

        XCTAssertNil(sut.movieDetails)
    }
}

extension MovieDetailsViewModelTests {
    static let mockMovie = Movie(id: 0, title: "Movie 1", backdropPath: nil)
    static let mockMovieDetails = MovieDetails(id: 0,
                                               title: "title",
                                               tagline: "tagline",
                                               rating: 7.2,
                                               backdropPath: nil,
                                               budget: 0,
                                               genres: nil,
                                               isAdultMovie: false,
                                               homepage: "http://movies.com",
                                               overview: "overview",
                                               language: "en",
                                               releaseDate: nil)
}
