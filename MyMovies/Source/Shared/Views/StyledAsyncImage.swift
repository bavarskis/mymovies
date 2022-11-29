//
//  StyledAsyncImage.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 28/11/2022.
//

import SwiftUI

struct StyledAsyncImage: View {
    let path: String
    
    init(path: String) {
        self.path = path
    }

    var body: some View {
        AsyncImage(url: URL(string: path)) { image in
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
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 200,
                       maxHeight: 200,
                       alignment: .center)
        }
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
    }
}
