//
//  LoginForm.swift
//  TaskManager
//
//  Created by Rodrigo Alanis Lemus on 07/08/23.
//

import SwiftUI

struct LoginForm: View {
    @EnvironmentObject private var authentication: AuthViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    let dismiss: () -> Void
    
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
                PrimaryButton(text: "Sign In") {
                    authentication.signIn(email: email, password: password)
                }
                
                SecondaryButton(text: "Return") {
                    dismiss()
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

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm(dismiss: {
            
        })
            .environmentObject(AuthViewModel())
    }
}
