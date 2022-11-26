//
//  Person.swift
//  MyMoviesTests
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import Foundation

struct Person: Codable {
    let name: String
    let age: Int
    let hasDrivingLicense: Bool

    private enum CodingKeys: String, CodingKey {
        case name
        case age
        case hasDrivingLicense = "has_driving_license"
    }
}
