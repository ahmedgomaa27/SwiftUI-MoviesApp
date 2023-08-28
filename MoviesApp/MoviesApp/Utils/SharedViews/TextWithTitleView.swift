//
//  TextWithTitleView.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 27/08/2023.
//

import SwiftUI
struct TextWithTitleView: View {
    let title: String
    let text: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)
                .bold()
            Text(text ?? "---")
            Divider()
        }
    }
}
struct TextWithTitleView_Previews: PreviewProvider {
    static var previews: some View {
        TextWithTitleView(title: "Title", text: "any value")
    }
}
