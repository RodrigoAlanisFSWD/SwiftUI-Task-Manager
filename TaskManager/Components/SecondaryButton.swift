//
//  SecondaryButton.swift
//  TaskManager
//
//  Created by Rodrigo Alanis Lemus on 06/08/23.
//

import SwiftUI

struct SecondaryButton: View {
    
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            GradientText(text: text, font: .system(size: 20, weight: .semibold, design: .rounded))
                .frame(width: 300, height: 50)
        }
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(text: "Button", action: {
            
        })
            .previewLayout(.sizeThatFits)
    }
}
