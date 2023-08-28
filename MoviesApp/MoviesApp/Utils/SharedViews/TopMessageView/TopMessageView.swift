//
//  TopMessageView.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 27/08/2023.
//

import SwiftUI

struct TopMessageView: View {
    var text: String
    var backgroundColor: Color = .red
    
    var body: some View {
        VStack {
            Text(text)
                .font(.subheadline)
                .foregroundColor(.white)
                .padding()
                .background(backgroundColor)
                .cornerRadius(10)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .transition(.move(edge: .top))
    }
}
struct TopMessageView_Previews: PreviewProvider {
    static var previews: some View {
        TopMessageView(text: "Something went wrong")
    }
}
