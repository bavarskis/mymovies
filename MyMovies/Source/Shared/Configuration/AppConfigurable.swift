//
//  AppConfigurable.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import Foundation

protocol AppConfigurable {
    static var serviceHost: String { get }
    static var serviceVersion: String { get }
    static var imagesLocation: String { get }
    static var language: String { get }
}
