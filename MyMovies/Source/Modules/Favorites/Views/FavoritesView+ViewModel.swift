//
//  FavoritesView+ViewModel.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 29/11/2022.
//

import Foundation

extension FavoritesView {
    @MainActor class ViewModel: ObservableObject, FileStoring {
        typealias Item = MovieDetails
        let storagePath = FavoritesStorage.storagePath

        @Published var favorites: [MovieDetails] = []

        func fetchFavorites() {
            do {
                favorites = try retrieveAll()
            } catch {
                print("no favorites found")
            }
        }
    }
}
