//
//  ContentView.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 25/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabsView()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
