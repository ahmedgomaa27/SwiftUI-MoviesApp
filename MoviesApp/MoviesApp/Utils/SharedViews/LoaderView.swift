//
//  LoaderView.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 25/08/2023.
//

import SwiftUI

struct LoaderView: View {
    @State private var isAnimating = false
    var size: CGFloat = 40
    var lineWidth: CGFloat = 3
    var color: Color = Color.green
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(color, lineWidth: lineWidth)
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    self.isAnimating = true
                }
            }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
