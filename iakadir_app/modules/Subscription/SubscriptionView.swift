//
//  SubscriptionView.swift
//  iakadir_app
//
//  Created by Ugo Wadoux on 11/12/2024.
//

import SwiftUI

struct SubscriptionView: View {
    var body: some View {
        ZStack {
            
            VStack() {
                // Header
                HStack {
                    Button(action: {}) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Déjà abonné ?")
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(20)
                    }
                }
                .padding()
                
                // Logo Container
                VStack(spacing: 16) {
                    Image("iakadir_mascotte") // Assurez-vous d'avoir cette image dans vos assets
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    Text("Iakadir PRO")
                        .foregroundColor(.white)
                        .font(.system(size: 32, weight: .bold))
                }
                .padding(.vertical, 32)
                
                // Features List
                VStack(spacing: 24) {
                    FeatureRow(icon: "sparkles", text: "Access to all features")
                    FeatureRow(icon: "cpu", text: "Powered by ChatGPT-4")
                    FeatureRow(icon: "message", text: "Unlimited message chat")
                    FeatureRow(icon: "doc.text", text: "More details answers")
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Pricing Options
                VStack(spacing: 16) {
                    // Weekly Option
                    Button(action: {}) {
                        VStack(spacing: 8) {
                            Text("3 jours gratuits, puis")
                                .foregroundColor(.white)
                            Text("$5,99 / semaine, annulable facilement")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.iakadirGreen).opacity(0.2))
                        .cornerRadius(16)
                    }
                    
                    // Annual Option
                    Button(action: {}) {
                        HStack {
                            Text("Annuel")
                                .foregroundColor(.white)
                            Text("$39,99 / an")
                                .foregroundColor(.white)
                            Spacer()
                            Text("Économise 89%")
                                .foregroundColor(.black)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color(.iakadirGreen))
                                .cornerRadius(12)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(16)
                    }
                }
                .padding(.horizontal)
                
                // Continue Button
                Button(action: {}) {
                    Text("Continuer")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("AccentGreen"))
                        .cornerRadius(16)
                }
                .padding(.horizontal)
                
                // Footer
                HStack(spacing: 16) {
                    Button("Confidentialité") {}
                        .foregroundColor(.gray)
                    Text("|")
                        .foregroundColor(.gray)
                    Button("Conditions d'utilisation") {}
                        .foregroundColor(.gray)
                }
                .font(.system(size: 14))
                .padding(.bottom)
            }
        }
    }
}

struct FeatureRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .foregroundColor(Color(.iakadirGreen))
                .font(.system(size: 24))
            
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 16))
            
            Spacer()
        }
    }
}

#Preview {
    SubscriptionView()
}
