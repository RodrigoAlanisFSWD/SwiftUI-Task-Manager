//
//  HomeView.swift
//  TaskManager
//
//  Created by Rodrigo Alanis Lemus on 06/08/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: .infinity)
                
                VStack(spacing: 20) {
                    Text("Welcome To")
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                    
                    GradientText(text: "Task Manager", font: .system(size: 45, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Enter Now")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(.white.opacity(0.8))
                            .frame(width: 300, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            )
                    }
                    .offset(y: 50)
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .background(Color.black.opacity(0.8))
                .offset(y: 200)
            }
            .ignoresSafeArea()
        }
        .toolbar(.hidden)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView()
            .environmentObject(AuthViewModel())
    }
}
