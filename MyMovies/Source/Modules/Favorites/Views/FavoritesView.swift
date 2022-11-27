//
//  FavoritesView.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("favorites.tab")
        }
        .padding()
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
