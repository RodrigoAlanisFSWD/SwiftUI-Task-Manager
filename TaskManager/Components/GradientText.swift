//
//  GradientText.swift
//  TaskManager
//
//  Created by Rodrigo Alanis Lemus on 07/08/23.
//

import SwiftUI

struct GradientText: View {
    
    let text: String
    let font: Font
    
    var body: some View {
        Text(text)
            .font(font)
            .overlay {
                LinearGradient(
                    colors: [.purple, .blue],
                    startPoint: .topLeading,
                               endPoint: .bottomTrailing
                )
                .mask(
                    Text(text)
                        .font(font)
                        .multilineTextAlignment(.center)
                )
            }
    }
}

struct GradientText_Previews: PreviewProvider {
    static var previews: some View {
        GradientText(text: "Gradient Text", font: .system(size: 20, weight: .semibold, design: .rounded))
    }
}
