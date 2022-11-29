//
//  RequestParametersTests.swift
//  MyMoviesTests
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import XCTest
@testable import MyMovies

final class RequestParametersTests: XCTestCase {
    func testWhenNoParametersArePassed_shouldReturnEmptyList() {
        let paramsContainer = RequestParameters.empty
        XCTAssertTrue(paramsContainer.queryItems.isEmpty)
    }

    func testWhenTwoParametersArePassed_shouldReturnTwoQueryItems() {
        let params: Parameters = ["name": "john", "age": 39]
        let paramsContainer = RequestParameters.dictionary(params)
        XCTAssertTrue(paramsContainer.queryItems.count == 2)
        XCTAssertEqual(paramsContainer.queryItems.first, URLQueryItem(name: "name", value: "john"))
        XCTAssertEqual(paramsContainer.queryItems.last, URLQueryItem(name: "age", value: "39"))
    }
}
