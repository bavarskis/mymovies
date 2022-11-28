//
//  MoviewView.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 27/11/2022.
//

import SwiftUI

struct ImageAndText: View {
    let imagePath: String?
    let text: String

    init(imagePath: String?, text: String) {
        self.imagePath = imagePath
        self.text = text
    }

    var body: some View {
        StyledAsyncImage(path: imagePath ?? "")
            .overlay(ImageOverlay(text: text), alignment: .bottom)
    }
}

struct ImageAndText_Previews: PreviewProvider {
    static var previews: some View {
        ImageAndText(imagePath: "", text: "Title")
    }
}
