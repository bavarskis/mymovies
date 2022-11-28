//
//  CoreError.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import Foundation

enum CoreError: Error {
    case generic(Error)
    case authentication
    case mapping(Error)
    case invalidUrl
}
