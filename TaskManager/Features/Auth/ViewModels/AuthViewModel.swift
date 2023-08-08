//
//  AuthViewModel.swift
//  TaskManager
//
//  Created by Rodrigo Alanis Lemus on 07/08/23.
//

import Foundation
import Firebase
import SwiftUI

class AuthViewModel: ObservableObject {
//  Firebase Auth
    @Published private var auth = Auth.auth()
    
//  Auth State (Global)
    @Published var state: AuthState = .initial
    
//  Sign Up Request Status And Message
    @Published var signUpMessage: String = "Register Error"
    
//  Sign In Request Status And Message
    @Published var signInMessage: String = ""
    
    init() {
        let user = auth.currentUser;
        
        print(user)
        
        guard user != nil else {
            state = .unauthenticated
            
            return
        }
        
        state = .authenticated
    }
    
    func signUp(email: String, password: String) {
        withAnimation {
            auth.createUser(withEmail: email, password: password) { res, err in
                guard err == nil else {
                    if let errDesc = err?.localizedDescription {
                        print(errDesc)
                        
                        self.state = .error
                        self.signUpMessage = errDesc
                    }
                    
                    return
                }
                
                self.signUpMessage = "User Created"
                self.state = .authenticated
            }
        }
    }
    
    func signIn(email: String, password: String) {
        withAnimation {
            auth.signIn(withEmail: email, password: password) { res, err in
                guard err == nil else {
                    if let errDesc = err?.localizedDescription {
                        print(errDesc)
                        
                        self.state = .error
                        self.signInMessage = errDesc
                    }
                    
                    return
                }
                
                self.signInMessage = "Login Successfull"
                self.state = .authenticated
            }
        }
    }
}
