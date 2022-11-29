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
            NavigationView {
                MoviesView()
                    .navigationTitle("movies")
            }
            .tabItem {
                Label("home.tab", systemImage: "house")
            }

            NavigationView {
                FavoritesView()
                    .navigationTitle("favorites.tab")
            }
            .tabItem {
                Label("favorites.tab", systemImage: "star")
            }
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
