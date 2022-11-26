//
//  MoviesView.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import SwiftUI

struct MoviesView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Movies!")
        }
        .padding()
        .onAppear {
            loadData()
        }
    }

    func loadData() {
        Task {
            let movies: Movies = try await DataFetcher().fetch(endpoint: .nowPlayingMovies, parameters: .empty)
            print(movies)
        }

    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
