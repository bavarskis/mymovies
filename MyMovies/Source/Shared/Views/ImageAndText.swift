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
        AsyncImage(url: URL(string: imagePath ?? "")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 200,
                       maxHeight: 200,
                       alignment: .center)
        } placeholder: {
            Text("loading")
                .frame(minWidth: 300,
                       maxWidth: .infinity,
                       minHeight: 200,
                       maxHeight: 200,
                       alignment: .center)
        }
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
        .overlay(ImageOverlay(text: text), alignment: .bottom)
    }
}

struct ImageAndText_Previews: PreviewProvider {
    static var previews: some View {
        ImageAndText(imagePath: "", text: "Title")
    }
}
