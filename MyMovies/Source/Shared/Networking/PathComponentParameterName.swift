//
//  PathComponentParameter.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 29/11/2022.
//

import Foundation

struct PathComponentParameterName {
    private(set) var value: String

    init(name: String) {
        self.value = "{\(name)}"
    }
}
