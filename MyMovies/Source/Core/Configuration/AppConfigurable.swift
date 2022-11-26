//
//  AppConfigurable.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import Foundation

protocol AppConfigurable {
    var serviceHost: String { get }
    var serviceVersion: String { get }
    var language: String { get }
}
