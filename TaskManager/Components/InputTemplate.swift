//
//  InputTemplate.swift
//  TaskManager
//
//  Created by Rodrigo Alanis Lemus on 06/08/23.
//

import SwiftUI

struct InputTemplate<Content: View>: View {
    
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack {
            content
            Rectangle()
                .fill(.white)
                .frame(width: 300, height: 1)
        }
        .frame(width: 300, height: 50)
    }
}

struct InputTemplate_Previews: PreviewProvider {
    static var previews: some View {
        InputTemplate {
            Text("Input")
        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
