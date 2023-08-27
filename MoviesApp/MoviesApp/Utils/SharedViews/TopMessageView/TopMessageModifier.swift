//
//  TopMessageModifier.swift
//  MoviesApp
//
//  Created by Ahmed Hamdy on 27/08/2023.
//

import SwiftUI

struct TopMessageModifier: ViewModifier {
    @Binding var isPresented: Bool
    var text: String
    var backgroundColor: Color = .red
    var duration: CGFloat = 2
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                VStack {
                    TopMessageView(text: text, backgroundColor: backgroundColor)
                    Spacer()
                }
                .animation(.easeInOut(duration: 0.3))
                .transition(.move(edge: .top))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        withAnimation {
                            isPresented = false
                        }
                    }
                }
            }
        }
    }
}
