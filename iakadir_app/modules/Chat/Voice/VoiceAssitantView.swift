//
//  VoiceAssitantView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 11/12/2024.
//

import SwiftUI

struct VoiceAssistantView: View {
    var body: some View {
        ZStack {
            // Background
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 24) {
                // Title
                Text("AI Buddy")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                    .background(Color("AccentGreen").opacity(0.2))
                    .cornerRadius(25)
                
                Spacer()
                
                // Visualization Container
                ZStack {
                    Image("Bubble") // Assurez-vous d'avoir cette image dans vos assets
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                
                // Response Text
                Text("Swift est un langage de programmation facile")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("d'apprentissage, simple ...")
                    .foregroundColor(.gray)
                    .font(.system(size: 20, weight: .medium))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                // Control Buttons
                HStack(spacing: 40) {
                    // Message Button
                    Button(action: {}) {
                        Image(systemName: "message")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Color.purple.opacity(0.3))
                            .clipShape(Circle())
                    }
                    
                    // Microphone Button
                    Button(action: {}) {
                        Image(systemName: "mic.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.black)
                            .frame(width: 80, height: 80)
                            .background(Color(.iakadirGreen))
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color(.iakadirGreen).opacity(0.3), lineWidth: 2)
                                    .frame(width: 100, height: 100)
                            )
                    }
                    
                    // Close Button
                    Button(action: {}) {
                        Image(systemName: "xmark")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Color.gray.opacity(0.3))
                            .clipShape(Circle())
                    }
                }
                .padding(.bottom, 32)
            }
        }
    }
}

#Preview {
    VoiceAssistantView()
}
