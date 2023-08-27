//
//  CircleProgressView.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 26/08/2023.
//

import SwiftUI

struct CircleProgressView: View {
    var progress: Double
    var text: String
    var lineColor: Color = .gray.opacity(0.3)
    var progressColor: Color = .green
    private let lineWidth: CGFloat = 3
    private let size: CGFloat = 36
    
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineColor, lineWidth: lineWidth)
                .frame(width: size)
            
            Circle()
                .trim(from: 0, to: CGFloat(min(progress, 1.0)))
                .stroke(progressColor, lineWidth: lineWidth)
                .rotationEffect(Angle(degrees: -90))
                .frame(width: size)
            
            Text(text)
                .font(.caption)
                .bold()
        }
    }
}

struct CircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressView(progress: 0.5, text: "50%")
    }
}
