//
//  HomeView.swift
//  TaskManager
//
//  Created by Rodrigo Alanis Lemus on 06/08/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.9)
            
            Rectangle()
                .fill(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: .infinity, height: 500)
                .offset(y: -200)
            
            VStack(spacing: 20) {
                Text("Welcome To")
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                Text("Task Manager")
                    .font(.system(size: 45, weight: .bold))
                    .multilineTextAlignment(.center)
                    .overlay {
                        LinearGradient(
                            colors: [.purple, .blue],
                            startPoint: .topLeading,
                                       endPoint: .bottomTrailing
                        )
                        .mask(
                            Text("Task Manager")
                                .font(.system(size: 45, weight: .bold))
                                .multilineTextAlignment(.center)
                        )
                    }
                
                PrimaryButton(text: "Enter Now", action: {
                    
                })
                .offset(y: 50)
            }
            .offset(y: 200)
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
