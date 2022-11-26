//
//  TabsView.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 26/11/2022.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
