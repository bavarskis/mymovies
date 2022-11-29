//
//  FavoritesStore.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 29/11/2022.
//

import Foundation

enum FavoritesStorage {
    static let storagePath: URL = FileManager.documentsDirectory.appendingPathComponent("favorites")
}
