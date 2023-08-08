//
//  SignUpView.swift
//  TaskManager
//
//  Created by Rodrigo Alanis Lemus on 06/08/23.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject private var authentication: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                
                VStack(spacing: 15) {
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.system(size: 45, weight: .bold, design: .rounded))
                        
                    Text("Create A New Account")
                        .foregroundColor(.white.opacity(0.8))
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }
                .offset(y: -250)
                
                switch authentication.state {
                    case .error:
                        SignUpError()
                        .transition(.opacity)
                        .zIndex(2)
                    case .authenticated:
                        SignUpSuccess()
                        .transition(.opacity)
                        .zIndex(2)
                    default:
                        SignUpForm()
                        .transition(.opacity)
                        .zIndex(2)
                }
            }
            .ignoresSafeArea()
        }
        .toolbar(.hidden)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(AuthViewModel())
    }
}
