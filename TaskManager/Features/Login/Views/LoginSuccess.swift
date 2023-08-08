//
//  LoginSuccess.swift
//  TaskManager
//
//  Created by Rodrigo Alanis Lemus on 07/08/23.
//

import SwiftUI

struct LoginSuccess: View {
    @EnvironmentObject private var authentication: AuthViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 20) {
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(LinearGradient(
                        colors: [.purple, .blue],
                        startPoint: .topLeading,
                                   endPoint: .bottomTrailing
                    ))
                    .frame(width: 200)
                
                GradientText(text: "Signed In", font: .system(size: 35, weight: .bold, design: .rounded))
            }
            
            
            VStack(spacing: 15) {
                PrimaryButton(text: "Continue") {
                    
                }
            }
            .offset(y: 50)
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .background(Color.black.opacity(0.8))
        .offset(y: 150)
    }
}

struct LoginSuccess_Previews: PreviewProvider {
    static var previews: some View {
        LoginSuccess()
            .environmentObject(AuthViewModel())
    }
}
