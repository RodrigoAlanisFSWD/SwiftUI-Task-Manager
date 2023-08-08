//
//  SignUpForm.swift
//  TaskManager
//
//  Created by Rodrigo Alanis Lemus on 07/08/23.
//

import SwiftUI

struct SignUpForm: View {
    
    @EnvironmentObject private var authentication: AuthViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            InputTemplate {
                TextField("Email", text: $email)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.white)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.white)
                    }
            }
            
            InputTemplate {
                SecureField("Password", text: $password)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.white)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                    }
            }
            
            VStack(spacing: 15) {
                PrimaryButton(text: "Sign Up") {
                    authentication.signUp(email: email, password: password)
                }
                
                NavigationLink {
                    LoginView()
                } label: {
                    GradientText(text: "Go To Login", font: .system(size: 20, weight: .semibold, design: .rounded))
                        .frame(width: 300, height: 50)
                }
            }
            .offset(y: 100)
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .background(Color.black.opacity(0.8))
        .offset(y: 150)
    }
}

struct SignUpForm_Previews: PreviewProvider {
    static var previews: some View {
        SignUpForm()
            .environmentObject(AuthViewModel())
    }
}
