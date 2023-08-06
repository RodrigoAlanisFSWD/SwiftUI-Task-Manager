//
//  PrimaryButton.swift
//  TaskManager
//
//  Created by Rodrigo Alanis Lemus on 06/08/23.
//

import SwiftUI

struct PrimaryButton: View {
    
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(.white.opacity(0.8))
                .frame(width: 300, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                )
                
        }
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Button", action: {
            
        })
            .previewLayout(.sizeThatFits)
    }
}
