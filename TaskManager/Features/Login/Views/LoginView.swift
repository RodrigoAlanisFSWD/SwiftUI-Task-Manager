//
//  LoginView.swift
//  TaskManager
//
//  Created by Rodrigo Alanis Lemus on 07/08/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject private var authentication: AuthViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                
                VStack(spacing: 15) {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.system(size: 45, weight: .bold, design: .rounded))
                        
                    Text("Login With Your Account")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }
                .offset(y: -250)
                
                switch authentication.state {
                    case .error:
                        LoginError()
                        .transition(.opacity)
                        .zIndex(2)
                    case .authenticated:
                        LoginSuccess()
                        .transition(.opacity)
                        .zIndex(2)
                    default:
                        LoginForm(dismiss: {
                            dismiss()
                        })
                        .transition(.opacity)
                        .zIndex(2)
                }
            }
            .ignoresSafeArea()
        }
        .toolbar(.hidden)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}
