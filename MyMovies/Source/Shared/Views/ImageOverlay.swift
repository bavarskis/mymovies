//
//  ImageOverlay.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 27/11/2022.
//

import SwiftUI

struct ImageOverlay: View {
    let text: String

    var body: some View {
        ZStack {
            Text(text)
                .font(.callout)
                .padding(10)
                .foregroundColor(.white)
        }.background(Color.black)
        .opacity(0.8)
        .cornerRadius(6.0)
        .padding(6)
    }
}

struct ImageOverlay_Previews: PreviewProvider {
    static var previews: some View {
        ImageOverlay(text: "Untitled")
    }
}
